'''
DEFINES
'''
IMM_ENABLE = 1
ALL_OP_EDGE_ENABLE = 0

import sys
from io import TextIOWrapper
from pathlib import Path
import json

import networkx as nx
import matplotlib.pyplot as plt
import math
from ast import List

import re

from enum import Enum

class ASM_FILE_READ(Enum):
    NO_NEW_LINE = 0
    DATA_FOUND = 1

class ASM_OPCODE_PARAMS(Enum):
    CALL = 0 # TODO: see if can be replaced by JUMP
    DST = 1
    SRC = 2
    IMM = 3
    EXIT = 4
    JUMP = 5
    OFFSET = 6
  
class RegisterNode:
    """
    Generates a new node for a register number
    """

    def __init__(self, reg_idx, lvl):
        self.register_index = reg_idx
        self.register_level = lvl
        self.label = 'R' + str(reg_idx)

    def get_label(self):
        return self.label
    
    def get_level(self):
        return self.register_level
    
class ImmediateValueNode:
    """
    Generates a new node for an immediate
    """

    def __init__(self, lvl):
        self.register_level = lvl
        self.label = 'Imm'

    def get_label(self):
        return self.label
    
    def get_level(self):
        return self.register_level
    
class JumpNode:
    """
    Generates a new node for jumps
    """

    def __init__(self, lvl):
        self.register_level = lvl
        self.label = 'Jmp'

    def get_label(self):
        return self.label
    
    def get_level(self):
        return self.register_level
    
class OperationNode:
    """
    Generates a new node for an operator
    """

    def __init__(self, op, lvl):
        self.operation = op
        self.register_level = lvl
        self.label = str(op)
    
    def get_operation(self):
        return self.operation

    def get_label(self):
        return self.label
    
    def get_level(self):
        return self.register_level

'''
GLOBALS
'''
disasm_blk_ptrn = "[abcdef\d]{16} <.+>:"    # Regex pattern to detect start of basic block
gline_count = 0
G = nx.DiGraph()
labels = {}
EOF = False

reg_operations = ['!=', '%=', '&=', '*=', '+=', '-=', '/=', '<<=', '=','>>=', '^=', 'be', 'le', 's>>=', '|=', '~']
# reg_operations = ['!', '%', '&', '*', '+', '-', '/', '<<', '=','>>', '^', 'be', 'le', 's>>', '|', '~']
jmp_comparisons = ['<=', '&', '>', 's>', 's<', '==', 's>=', '<', 's<=', '>=']

# TODO: Replace with definition in data_structures.py
# TODO: Handle deprecated load instructions
opcodes = {0x04: ('add32',    'dstimm',        {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.IMM]},                                 '+',     32),
            0x05: ('ja',       'joff',         {'output': ASM_OPCODE_PARAMS.JUMP, 'inputs': [ASM_OPCODE_PARAMS.IMM]},                                                       None,    64),
            0x07: ('add',      'dstimm',       {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.IMM]},                                 '+',     64),
            0x0c: ('add32',    'dstsrc',       {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.SRC]},                                 '+',     32),
            0x0f: ('add',      'dstsrc',       {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.SRC]},                                 '+',     64),
            0x14: ('sub32',    'dstimm',       {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.IMM]},                                 '-',     32),
            0x15: ('jeq',      'jdstimmoff',   {'output': ASM_OPCODE_PARAMS.JUMP, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.IMM, ASM_OPCODE_PARAMS.OFFSET]},      '==',    64),
            0x16: ('jeq',      'jdstimmoff',   {'output': ASM_OPCODE_PARAMS.JUMP, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.IMM, ASM_OPCODE_PARAMS.OFFSET]},      '==',    32),
            0x17: ('sub',      'dstimm',       {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.IMM]},                                 '-',     64),
            0x18: ('lddw',     'lddstimm',     {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.IMM]},                                                        'load',  64),
            0x1c: ('sub32',    'dstsrc',       {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.SRC]},                                 '-',     32),
            0x1d: ('jeq',      'jdstsrcoff',   {'output': ASM_OPCODE_PARAMS.JUMP, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.SRC, ASM_OPCODE_PARAMS.OFFSET]},      '==',     64),
            0x1e: ('jeq',      'jdstsrcoff',   {'output': ASM_OPCODE_PARAMS.JUMP, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.SRC, ASM_OPCODE_PARAMS.OFFSET]},      '==',     32),
            0x1f: ('sub',      'dstsrc',       {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.SRC]},                                 '-',     64),
            0x20: ('ldabsw',   'ldabs',        {'output': None, 'inputs': []},                                                                                              None,     32),
            0x24: ('mul32',    'dstimm',       {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.IMM]},                                 '*',     32),
            0x25: ('jgt',      'jdstimmoff',   {'output': ASM_OPCODE_PARAMS.JUMP, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.IMM, ASM_OPCODE_PARAMS.OFFSET]},      '>',      64),
            0x26: ('jgt32',    'jdstimmoff',   {'output': ASM_OPCODE_PARAMS.JUMP, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.IMM, ASM_OPCODE_PARAMS.OFFSET]},      '>',      32),
            0x27: ('mul',      'dstimm',       {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.IMM]},                                 '*',     64),
            0x28: ('ldabsh',   'ldabs',        {'output': None, 'inputs': []},                                                                                              None,     16),
            0x2c: ('mul32',    'dstsrc',       {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.SRC]},                                 '*',     32),
            0x2d: ('jgt',      'jdstsrcoff',   {'output': ASM_OPCODE_PARAMS.JUMP, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.SRC, ASM_OPCODE_PARAMS.OFFSET]},      '>',      64),
            0x2e: ('jgt',      'jdstsrcoff',   {'output': ASM_OPCODE_PARAMS.JUMP, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.SRC, ASM_OPCODE_PARAMS.OFFSET]},      '>',      32),
            0x2f: ('mul',      'dstsrc',       {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.SRC]},                                 '*',     64),
            0x30: ('ldabsb',   'ldabs',        {'output': None, 'inputs': []},                                                                                              None,      8),
            0x34: ('div32',    'dstimm',       {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.IMM]},                                 '/',     32),
            0x35: ('jge',      'jdstimmoff',   {'output': ASM_OPCODE_PARAMS.JUMP, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.IMM, ASM_OPCODE_PARAMS.OFFSET]},      '>=',     64),
            0x37: ('div',      'dstimm',       {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.IMM]},                                 '/',     64),
            0x38: ('ldabsdw',  'ldabs',        {'output': None, 'inputs': []},                                                                                              None,     64),
            0x3c: ('div32',    'dstsrc',       {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.SRC]},                                 '/',     32),
            0x3d: ('jge',      'jdstsrcoff',   {'output': ASM_OPCODE_PARAMS.JUMP, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.SRC, ASM_OPCODE_PARAMS.OFFSET]},      '>=',     64),
            0x3f: ('div',      'dstsrc',       {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.SRC]},                                 '/',     64),
            0x40: ('ldindw',   'ldind',        {'output': None, 'inputs': []},                                                                                              None,     32),
            0x44: ('or32',     'dstimm',       {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.IMM]},                                 '|',     32),
            0x45: ('jset',     'jdstimmoff',   {'output': ASM_OPCODE_PARAMS.JUMP, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.IMM, ASM_OPCODE_PARAMS.OFFSET]},      '&',      64),
            0x47: ('or',       'dstimm',       {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.IMM]},                                 '|',     64),
            0x48: ('ldindh',   'ldind',        {'output': None, 'inputs': []},                                                                                              None,     16),
            0x4c: ('or32',     'dstsrc',       {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.SRC]},                                 '|',     32),
            0x4d: ('jset',     'jdstsrcoff',   {'output': ASM_OPCODE_PARAMS.JUMP, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.SRC, ASM_OPCODE_PARAMS.OFFSET]},      '&',      64),
            0x4f: ('or',       'dstsrc',       {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.SRC]},                                 '|',     64),
            0x50: ('ldindb',   'ldind',        {'output': None, 'inputs': []},                                                                                              None,      8),
            0x54: ('and32',    'dstimm',       {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.IMM]},                                 '&',     32),
            0x55: ('jne',      'jdstimmoff',   {'output': ASM_OPCODE_PARAMS.JUMP, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.IMM, ASM_OPCODE_PARAMS.OFFSET]},      '!',     64),
            0x56: ('jne',      'jdstimmoff',   {'output': ASM_OPCODE_PARAMS.JUMP, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.IMM, ASM_OPCODE_PARAMS.OFFSET]},      '!',     32),
            0x57: ('and',      'dstimm',       {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.IMM]},                                 '&',     64),
            0x58: ('ldinddw',  'ldind',        {'output': None, 'inputs': []},                                                                                              None,     64),
            0x5c: ('and32',    'dstsrc',       {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.SRC]},                                 '&',     32),
            0x5d: ('jne',      'jdstsrcoff',   {'output': ASM_OPCODE_PARAMS.JUMP, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.SRC, ASM_OPCODE_PARAMS.OFFSET]},      '!',     64),
            0x5e: ('jne',      'jdstsrcoff',   {'output': ASM_OPCODE_PARAMS.JUMP, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.SRC, ASM_OPCODE_PARAMS.OFFSET]},      '!',     32),
            0x5f: ('and',      'dstsrc',       {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.SRC]},                                 '&',     64),
            0x61: ('ldxw',     'ldstsrcoff',   {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.SRC, ASM_OPCODE_PARAMS.OFFSET]},                              'load',   32),
            0x62: ('stw',      'sdstoffimm',   {'output': None, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.OFFSET, ASM_OPCODE_PARAMS.IMM]},                        'store',     32),
            0x63: ('stxw',     'sdstoffsrc',   {'output': None, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.OFFSET, ASM_OPCODE_PARAMS.SRC]},                        'store',     32),
            0x64: ('lsh32',    'dstimm',       {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.IMM]},                                 '<<',    32),
            0x65: ('jsgt',     'jdstimmoff',   {'output': ASM_OPCODE_PARAMS.JUMP, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.IMM, ASM_OPCODE_PARAMS.OFFSET]},      's>',     64),
            0x66: ('jsgt',     'jdstimmoff',   {'output': ASM_OPCODE_PARAMS.JUMP, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.IMM, ASM_OPCODE_PARAMS.OFFSET]},      's>',     32),
            0x67: ('lsh',      'dstimm',       {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.IMM]},                                 '<<',    64),
            0x69: ('ldxh',     'ldstsrcoff',   {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.SRC, ASM_OPCODE_PARAMS.OFFSET]},                              'load',     16),
            0x6a: ('sth',      'sdstoffimm',   {'output': None, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.OFFSET, ASM_OPCODE_PARAMS.IMM]},                        'store',     16),
            0x6b: ('stxh',     'sdstoffsrc',   {'output': None, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.OFFSET, ASM_OPCODE_PARAMS.SRC]},                        'store',     16),
            0x6c: ('lsh32',    'dstsrc',       {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.SRC]},                                 '<<',    32),
            0x6d: ('jsgt',     'jdstsrcoff',   {'output': ASM_OPCODE_PARAMS.JUMP, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.SRC, ASM_OPCODE_PARAMS.OFFSET]},      's>',     64),
            0x6f: ('lsh',      'dstsrc',       {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.SRC]},                                 '<<',    64),
            0x71: ('ldxb',     'ldstsrcoff',   {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.SRC, ASM_OPCODE_PARAMS.OFFSET]},                              'load',      8),
            0x72: ('stb',      'sdstoffimm',   {'output': None, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.OFFSET, ASM_OPCODE_PARAMS.IMM]},                        'store',      8),
            0x73: ('stxb',     'sdstoffsrc',   {'output': None, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.OFFSET, ASM_OPCODE_PARAMS.SRC]},                        'store',      8),
            0x74: ('rsh32',    'dstimm',       {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.IMM]},                                 '>>',    32),
            0x75: ('jsge',     'jdstimmoff',   {'output': ASM_OPCODE_PARAMS.JUMP, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.IMM, ASM_OPCODE_PARAMS.OFFSET]},      's>=',    64),
            0x77: ('rsh',      'dstimm',       {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.IMM]},                                 '>>',    64),
            0x79: ('ldxdw',    'ldstsrcoff',   {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.SRC, ASM_OPCODE_PARAMS.OFFSET]},                              'load',     64),
            0x7a: ('stdw',     'sdstoffimm',   {'output': None, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.OFFSET, ASM_OPCODE_PARAMS.IMM]},                        'store',     64),
            0x7b: ('stxdw',    'sdstoffsrc',   {'output': None, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.OFFSET, ASM_OPCODE_PARAMS.SRC]},                        'store',     64),
            0x7c: ('rsh32',    'dstsrc',       {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.SRC]},                                 '>>',    32),
            0x7d: ('jsge',     'jdstsrcoff',   {'output': ASM_OPCODE_PARAMS.JUMP, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.SRC, ASM_OPCODE_PARAMS.OFFSET]},      's>=',    64),
            0x7f: ('rsh',      'dstsrc',       {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.SRC]},                                 '>>',    64),
            0x84: ('neg32',    'dst',          {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.DST]},                                                        '~',      32),
            0x85: ('call',     'call',         {'output': ASM_OPCODE_PARAMS.JUMP, 'inputs': [ASM_OPCODE_PARAMS.IMM]},                                                       None,     64),
            0x87: ('neg',      'dst',          {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.DST]},                                                        '~',      64),
            0x94: ('mod32',    'dstimm',       {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.IMM]},                                 '%',     32),
            0x95: ('exit',     'exit',         {'output': ASM_OPCODE_PARAMS.EXIT, 'inputs': None},                                                                                            None,     64),
            0x97: ('mod',      'dstimm',       {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.IMM]},                                 '%',     64),
            0x9c: ('mod32',    'dstsrc',       {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.SRC]},                                 '%',     32),
            0x9f: ('mod',      'dstsrc',       {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.SRC]},                                 '%',     64),
            0xa4: ('xor32',    'dstimm',       {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.IMM]},                                 '^',     32),
            0xa5: ('jlt',      'jdstimmoff',   {'output': ASM_OPCODE_PARAMS.JUMP, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.IMM, ASM_OPCODE_PARAMS.OFFSET]},      '<',      64),
            0xa6: ('jlt',      'jdstimmoff',   {'output': ASM_OPCODE_PARAMS.JUMP, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.IMM, ASM_OPCODE_PARAMS.OFFSET]},      '<',      32),
            0xa7: ('xor',      'dstimm',       {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.IMM]},                                 '^',     64),
            0xac: ('xor32',    'dstsrc',       {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.SRC]},                                 '^',     32),
            0xad: ('jlt',      'jdstsrcoff',   {'output': ASM_OPCODE_PARAMS.JUMP, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.SRC, ASM_OPCODE_PARAMS.OFFSET]},      '<',      64),
            0xae: ('jlt',      'jdstsrcoff',   {'output': ASM_OPCODE_PARAMS.JUMP, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.SRC, ASM_OPCODE_PARAMS.OFFSET]},      '<',      32),
            0xaf: ('xor',      'dstsrc',       {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.SRC]},                                 '^',     64),
            0xb4: ('mov32',    'dstimm',       {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.IMM]},                                                        '=',      32),
            0xb5: ('jle',      'jdstimmoff',   {'output': ASM_OPCODE_PARAMS.JUMP, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.IMM, ASM_OPCODE_PARAMS.OFFSET]},      '<=',     64),
            0xb7: ('mov',      'dstimm',       {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.IMM]},                                                        '=',      64),
            0xbc: ('mov32',    'dstsrc',       {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.SRC]},                                                        '=',      32),
            0xbd: ('jle',      'jdstsrcoff',   {'output': ASM_OPCODE_PARAMS.JUMP, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.SRC, ASM_OPCODE_PARAMS.OFFSET]},      '<=',     64),
            0xbf: ('mov',      'dstsrc',       {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.SRC]},                                                        '=',      64),
            0xc4: ('arsh32',   'dstimm',       {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.IMM]},                                 's>>',   32),
            0xc5: ('jslt',     'jdstimmoff',   {'output': ASM_OPCODE_PARAMS.JUMP, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.IMM, ASM_OPCODE_PARAMS.OFFSET]},      's<',     64),
            0xc6: ('jslt',     'jdstimmoff',   {'output': ASM_OPCODE_PARAMS.JUMP, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.IMM, ASM_OPCODE_PARAMS.OFFSET]},      's<',     32),
            0xc7: ('arsh',     'dstimm',       {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.IMM]},                                 's>>',   64),
            0xcc: ('arsh32',   'dstsrc',       {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.SRC]},                                 's>>',   32),
            0xcd: ('jslt',     'jdstsrcoff',   {'output': ASM_OPCODE_PARAMS.JUMP, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.SRC, ASM_OPCODE_PARAMS.OFFSET]},      's<',     64),
            0xce: ('jslt',     'jdstsrcoff',   {'output': ASM_OPCODE_PARAMS.JUMP, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.SRC, ASM_OPCODE_PARAMS.OFFSET]},      's<',     32),
            0xcf: ('arsh',     'dstsrc',       {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.SRC]},                                 's>>',   64),
            0xd3: ('atomic',   'sdstoffsrc',   {'output': None, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.OFFSET, ASM_OPCODE_PARAMS.SRC]},                        None,     32),
            0xd4: ('endxle',   'dstsrc',       {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.DST]},                                                        'le',     64),
            0xd5: ('jsle',     'jdstimmoff',   {'output': ASM_OPCODE_PARAMS.JUMP, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.IMM, ASM_OPCODE_PARAMS.OFFSET]},      's<=',    64),
            0xdb: ('atomic',   'sdstoffsrc',   {'output': None, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.OFFSET, ASM_OPCODE_PARAMS.SRC]},                        None,     64),
            0xdc: ('endxbe',   'dstsrc',       {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.DST]},                                                        'be',     64),
            0xdd: ('jsle',     'jdstimmoff',   {'output': ASM_OPCODE_PARAMS.JUMP, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.IMM, ASM_OPCODE_PARAMS.OFFSET]},      's<=',    64),}

def count_asm():
    diss_asm: str
    hex_str: str
    opcodes_count = {}

    with open(sys.argv[-1], "r") as f:
        diss_asm = f.read()

    for line in diss_asm.split('\n'):

        if line.strip() == '':
            continue

        hex_str = line.split(':')[1].split('\t')

        if ( len(hex_str) != 3 ):
            continue

        hex_str = hex_str[1].split(' ')

        hex_opcode = int(hex_str[0], 16)

        # count the number of each instruction
        if opcodes[hex_opcode][0] in opcodes_count:
            opcodes_count[opcodes[hex_opcode][0]] += 1
        else:
            opcodes_count[opcodes[hex_opcode][0]] = 1

    # close the file
    f.close()

    # store under it's own name
    filename = ("./bin/" + Path(sys.argv[-1]).stem + ".txt")
    with open(filename, "w", encoding='utf-8') as f:
        json.dump(opcodes_count, f, ensure_ascii=False, indent=4)

    # close the file
    f.close()

    # store all names in one file
    with open("./bin/all.txt", "a", encoding='utf-8') as f:
        f.write(filename + "\n")

    # close the file
    f.close()

    # store all counts in one file
    with open("./bin/all_count.txt", "a", encoding='utf-8') as f:
        f.write(str(opcodes_count) + "\n")

    # close the file
    f.close()


def main():
    global gline_count
    global G
    hex_str: str
    opcodes_count = {}
    node_list = []
    action_edges = []
    carry_edges = []
    bb_ln_cnt = []

    disasm_file = open(sys.argv[-1], "r")

    # Iterate the first time to generate list of instruction counts in each basic block
    bb_ln_cnt = pre_process_lines( disasm_file )
    print( bb_ln_cnt )
    graph_dims_sqr = math.ceil(math.sqrt(len(bb_ln_cnt)))

    # Return to top of file
    disasm_file.seek(0)

    fig, axs = plt.subplots(graph_dims_sqr, graph_dims_sqr)
    graph_col = 0
    graph_row = 0
    while (not EOF):
        ret = process_lines( disasm_file )
        node_list = ret[0]
        action_edges = ret[1]
        carry_edges = ret[2]


        labels = {}
        for nodes in node_list:
            for node in nodes:
                labels[node] = node.get_label()

        pos = nx.nx_agraph.graphviz_layout(G, prog="dot")
        
        nx.draw_networkx_nodes(G, pos, ax=axs[graph_row][graph_col], node_size=300)
        nx.draw_networkx_edges(G, pos, ax=axs[graph_row][graph_col], edgelist=carry_edges)
        nx.draw_networkx_edges(G, pos, ax=axs[graph_row][graph_col], edgelist=action_edges, edge_color='b')
        nx.draw_networkx_labels(G, pos, labels, ax=axs[graph_row][graph_col], font_size=8)

        # Create new graph
        G = nx.DiGraph()

        # 2D indexing
        graph_col += 1
        if( graph_col == graph_dims_sqr ):
            graph_col = 0
            graph_row += 1
        
        # Reset line_count due to new subplot
        gline_count = 0
    while( not(graph_row == graph_dims_sqr) and not (graph_col == graph_dims_sqr) ):
        fig.delaxes(axs[graph_row][graph_col])
        # 2D indexing
        graph_col += 1
        if( graph_col == graph_dims_sqr ):
            graph_col = 0
            graph_row += 1
        if( graph_row == 3 ):
            break

    # nx.draw(G, pos=pos, labels=labels, with_labels=True, node_size=600, font_weight='bold')
    plt.tight_layout()
    # plt.subplots_adjust(bottom=0.005, right=0.995, top=0.995, left=0.005, wspace=0.02, hspace=0.02)
    plt.show()


# Read the current file until a basic block is found, then return
def find_block( f : TextIOWrapper ) -> ASM_FILE_READ:
    asm_line: str
    while True:
        asm_line = f.readline()

        if not asm_line:
            return ASM_FILE_READ.NO_NEW_LINE
        
        if asm_line.strip() == '':
            continue

        if( re.search(disasm_blk_ptrn, asm_line) ):
            if __debug__:
                print("BLOCK: " + asm_line)
            return ASM_FILE_READ.DATA_FOUND

def pre_process_lines (f: TextIOWrapper ):
    asm_line: str
    hex_str: str
    basic_block_sizes = []
    curr_count = 1 # SET TO 1 TO ACCOUNT FOR INITAL REGISTER LAYER

    while True:
        asm_line = f.readline()

        if not asm_line:
            return basic_block_sizes
        
        if asm_line.strip() == '':
            continue

        hex_str = asm_line.split(':')[1].split('\t')

        if ( len(hex_str) != 3 ):
            continue

        # Valid instruction found;
        # begin procesing operation information
        hex_str = hex_str[1].split(' ')

        hex_opcode = int(hex_str[0], 16)

        if ( opcodes[hex_opcode][2]["output"] == ASM_OPCODE_PARAMS.DST ):
            curr_count += 1
        elif ( opcodes[hex_opcode][2]["output"] == ASM_OPCODE_PARAMS.JUMP ):
            curr_count += 1
            basic_block_sizes.append(curr_count)
            curr_count = 0
        elif ( opcodes[hex_opcode][2]["output"] == ASM_OPCODE_PARAMS.EXIT ):
            curr_count += 1
            basic_block_sizes.append(curr_count)
            curr_count = 0


    return

def process_lines( f: TextIOWrapper ):
    global gline_count
    global labels
    global EOF
    asm_line: str
    hex_str: str
    nodes_all = []
    action_edges = []
    carry_edges = []
    
    
    # Generate first row of registers
    nodes_curr_lvl = []
    for idx in range(0, 11):
        nodes_curr_lvl.append(RegisterNode(idx, gline_count))
        G.add_node(nodes_curr_lvl[-1], level = nodes_curr_lvl[-1].get_level())
    
    # Add 'immediate' node
    if IMM_ENABLE:
        nodes_curr_lvl.append(ImmediateValueNode(gline_count))
        G.add_node(nodes_curr_lvl[-1], level = nodes_curr_lvl[-1].get_level())

    # Add first row to all nodes list
    nodes_all.append(nodes_curr_lvl)


    while True:
        asm_line = f.readline()

        if not asm_line:
            EOF = True
            return [nodes_all, action_edges, carry_edges]
        
        if asm_line.strip() == '':
            continue

        hex_str = asm_line.split(':')[1].split('\t')

        if ( len(hex_str) != 3 ):
            continue

        # Valid instruction found;
        # begin procesing operation information
        hex_str = hex_str[1].split(' ')

        hex_opcode = int(hex_str[0], 16)
        hex_reg_dst = (int(hex_str[1], 16) & 0xF)
        hex_reg_src = (int(hex_str[1], 16)  & 0xF0) >> 4
        hex_offset = ((int(hex_str[3], 16)<<8) + int(hex_str[2], 16))
        if(hex_opcode == 24):
            # 64 bit imm
            hex_imm = ((int(hex_str[15], 16) << 88) \
                        + (int(hex_str[14], 16) << 80) \
                        + (int(hex_str[13], 16) << 72) \
                        + (int(hex_str[12], 16) << 64) \
                        + (int(hex_str[11], 16) << 56) \
                        + (int(hex_str[10], 16) << 48) \
                        + (int(hex_str[9], 16) << 40) \
                        + (int(hex_str[8], 16) << 32) \
                        + (int(hex_str[7], 16) << 24) \
                        + (int(hex_str[6], 16) << 16) \
                        + (int(hex_str[5], 16) << 8) \
                        + (int(hex_str[4], 16)))

        else:
            # 32 bit imm
            hex_imm = ((int(hex_str[7], 16)<<24) \
                        + (int(hex_str[6], 16)<<16) \
                        + (int(hex_str[5], 16)<<8) \
                        + (int(hex_str[4], 16)))
        if __debug__:
            print( "OPCODE: " + hex(hex_opcode) )
            print( "REG_DST: " + str(hex_reg_dst) )
            print( "REG_SRC: " + str(hex_reg_src) )
            print( "OFFSET: " + str(hex_offset) )
            print( "IMM: " + str(hex_imm) + '\n')
        
        nodes_curr_lvl = []
        gline_count = gline_count + 1
        if( opcodes[hex_opcode][2]["output"] == ASM_OPCODE_PARAMS.DST ):
            # Create operations layer
            nodes_curr_lvl.append(OperationNode(opcodes[hex_opcode][3], gline_count))
            G.add_node(nodes_curr_lvl[-1], level = nodes_curr_lvl[-1].get_level())

            ### TODO: REMOVE - GENERATES ALL OPERATIONS ###
            # for op in reg_operations:
            #     nodes_curr_lvl.append(OperationNode(op, gline_count))
            #     G.add_node(nodes_curr_lvl[-1], level = nodes_curr_lvl[-1].get_level())

            # Add the operation layer to all nodes
            nodes_all.append(nodes_curr_lvl)

            # Find active_edges
            input_regs = []
            for input in opcodes[hex_opcode][2]["inputs"]:
                match input:
                    case ASM_OPCODE_PARAMS.DST:
                        input_regs.append(hex_reg_dst)
                    case ASM_OPCODE_PARAMS.SRC:
                        input_regs.append(hex_reg_src)
                    case ASM_OPCODE_PARAMS.IMM:
                        if IMM_ENABLE:
                            input_regs.append(11)
                    case ASM_OPCODE_PARAMS.OFFSET:
                        if IMM_ENABLE:
                            input_regs.append(11)
                    case _:
                        print("ERROR")
            
            # Connect edges
            num_nodes = 12 if IMM_ENABLE else 11
            for i in range(0, num_nodes):
                for op_node in nodes_curr_lvl:
                    # if the register is an input and the operation node is the active operation
                    if (i in input_regs) and (op_node.get_operation() == opcodes[hex_opcode][3]):
                        # active_edge found
                        G.add_edge(nodes_all[gline_count-1][i], op_node)
                        action_edges.append((nodes_all[gline_count-1][i], op_node))
                    else:
                        G.add_edge(nodes_all[gline_count-1][i], op_node)
                        if ALL_OP_EDGE_ENABLE:
                            carry_edges.append((nodes_all[gline_count-1][i], op_node))
        elif ( opcodes[hex_opcode][2]["output"] == ASM_OPCODE_PARAMS.JUMP ):
            # Create jump layer
            nodes_curr_lvl.append(JumpNode(gline_count))
            G.add_node(nodes_curr_lvl[-1], level = nodes_curr_lvl[-1].get_level())

            # Add the jump layer to all nodes
            nodes_all.append(nodes_curr_lvl)

            # Find active_edges
            input_regs = []
            for input in opcodes[hex_opcode][2]["inputs"]:
                match input:
                    case ASM_OPCODE_PARAMS.DST:
                        input_regs.append(hex_reg_dst)
                    case ASM_OPCODE_PARAMS.SRC:
                        input_regs.append(hex_reg_src)
                    case ASM_OPCODE_PARAMS.IMM:
                        if IMM_ENABLE:
                            input_regs.append(11)
                    case ASM_OPCODE_PARAMS.OFFSET:
                        if IMM_ENABLE:
                            input_regs.append(11)
                    case _:
                        print("ERROR")

            # Connect edges
            num_nodes = 12 if IMM_ENABLE else 11
            for i in range(0, num_nodes):
                for jmp_node in nodes_curr_lvl:
                    # if the register is an input and the operation node is the active operation
                    if (i in input_regs):
                        # active_edge found
                        G.add_edge(nodes_all[gline_count-1][i], jmp_node)
                        action_edges.append((nodes_all[gline_count-1][i], jmp_node))
                    else:
                        G.add_edge(nodes_all[gline_count-1][i], jmp_node)
                        if ALL_OP_EDGE_ENABLE:
                            carry_edges.append((nodes_all[gline_count-1][i], jmp_node))

            return [nodes_all, action_edges, carry_edges]

        elif( opcodes[hex_opcode][2]["output"] == ASM_OPCODE_PARAMS.EXIT ):
            gline_count = gline_count - 1
        
        nodes_curr_lvl = []
        gline_count = gline_count + 1

        # Create destination register layer
        for idx in range(0, 11):
            nodes_curr_lvl.append(RegisterNode(idx, gline_count))
            G.add_node(nodes_curr_lvl[-1], level = nodes_curr_lvl[-1].get_level())
        
        # Add 'immediate' node
        if IMM_ENABLE:
            nodes_curr_lvl.append(ImmediateValueNode(gline_count))
            G.add_node(nodes_curr_lvl[-1], level = nodes_curr_lvl[-1].get_level())
        
        # Add new row to all nodes list
        nodes_all.append(nodes_curr_lvl)

        if( opcodes[hex_opcode][2]["output"] == ASM_OPCODE_PARAMS.DST ):
            num_nodes = 12 if IMM_ENABLE else 11
            for op_node in nodes_all[gline_count-1]:
                for i in range(0,num_nodes):
                    if (i == hex_reg_dst) and (op_node.get_operation() == opcodes[hex_opcode][3]):
                        # active_edge found
                        G.add_edge(op_node, nodes_all[gline_count][i])
                        action_edges.append((op_node, nodes_all[gline_count][i]))
                    else:
                        G.add_edge(op_node, nodes_all[gline_count][i])
                        if ALL_OP_EDGE_ENABLE:
                            carry_edges.append((op_node, nodes_all[gline_count][i]))
        elif( opcodes[hex_opcode][2]["output"] == ASM_OPCODE_PARAMS.JUMP ):
            num_nodes = 12 if IMM_ENABLE else 11
            for jmp_node in nodes_all[gline_count-1]:
                for i in range(0,num_nodes):
                    G.add_edge(jmp_node, nodes_all[gline_count][i])
                    if ALL_OP_EDGE_ENABLE:
                        carry_edges.append((jmp_node, nodes_all[gline_count][i]))
        elif( opcodes[hex_opcode][2]["output"] == ASM_OPCODE_PARAMS.EXIT ):
            num_nodes = 12 if IMM_ENABLE else 11
            for i in range(0,num_nodes):
                G.add_edge(nodes_all[gline_count-1][i], nodes_all[gline_count][i])
                if ALL_OP_EDGE_ENABLE:
                    carry_edges.append((nodes_all[gline_count-1][i], nodes_all[gline_count][i]))

if __name__ == "__main__":
    main()