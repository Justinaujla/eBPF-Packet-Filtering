'''
DEFINES
'''
IMM_ENABLE = 0

import sys
from io import TextIOWrapper
from pathlib import Path
import json

import networkx as nx
import matplotlib.pyplot as plt
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
    
class OperationNode:
    """
    Generates a new node for an operator
    """

    def __init__(self, op, lvl):
        self.operation = op
        self.register_level = lvl
        self.label = str(op)

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



# TODO: Replace with definition in data_structures.py
# TODO: Handle deprecated load instructions
opcodes = {0x04: ('add32',    'dstimm',        {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.IMM]},                                 '+=',     32),
            0x05: ('ja',       'joff',         {'output': ASM_OPCODE_PARAMS.JUMP, 'inputs': [ASM_OPCODE_PARAMS.IMM]},                                                       None,     64),
            0x07: ('add',      'dstimm',       {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.IMM]},                                 '+=',     64),
            0x0c: ('add32',    'dstsrc',       {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.SRC]},                                 '+=',     32),
            0x0f: ('add',      'dstsrc',       {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.SRC]},                                 '+=',     64),
            0x14: ('sub32',    'dstimm',       {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.IMM]},                                 '-=',     32),
            0x15: ('jeq',      'jdstimmoff',   {'output': ASM_OPCODE_PARAMS.JUMP, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.IMM, ASM_OPCODE_PARAMS.OFFSET]},      '==',     64),
            0x16: ('jeq',      'jdstimmoff',   {'output': ASM_OPCODE_PARAMS.JUMP, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.IMM, ASM_OPCODE_PARAMS.OFFSET]},      '==',     32),
            0x17: ('sub',      'dstimm',       {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.IMM]},                                 '-=',     64),
            0x18: ('lddw',     'lddstimm',     {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.IMM]},                                                        None,     64),
            0x1c: ('sub32',    'dstsrc',       {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.SRC]},                                 '-=',     32),
            0x1d: ('jeq',      'jdstsrcoff',   {'output': ASM_OPCODE_PARAMS.JUMP, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.SRC, ASM_OPCODE_PARAMS.OFFSET]},      '==',     64),
            0x1e: ('jeq',      'jdstsrcoff',   {'output': ASM_OPCODE_PARAMS.JUMP, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.SRC, ASM_OPCODE_PARAMS.OFFSET]},      '==',     32),
            0x1f: ('sub',      'dstsrc',       {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.SRC]},                                 '-=',     64),
            0x20: ('ldabsw',   'ldabs',        {'output': None, 'inputs': []},                                                                                              None,     32),
            0x24: ('mul32',    'dstimm',       {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.IMM]},                                 '*=',     32),
            0x25: ('jgt',      'jdstimmoff',   {'output': ASM_OPCODE_PARAMS.JUMP, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.IMM, ASM_OPCODE_PARAMS.OFFSET]},      '>',      64),
            0x26: ('jgt32',    'jdstimmoff',   {'output': ASM_OPCODE_PARAMS.JUMP, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.IMM, ASM_OPCODE_PARAMS.OFFSET]},      '>',      32),
            0x27: ('mul',      'dstimm',       {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.IMM]},                                 '*=',     64),
            0x28: ('ldabsh',   'ldabs',        {'output': None, 'inputs': []},                                                                                              None,     16),
            0x2c: ('mul32',    'dstsrc',       {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.SRC]},                                 '*=',     32),
            0x2d: ('jgt',      'jdstsrcoff',   {'output': ASM_OPCODE_PARAMS.JUMP, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.SRC, ASM_OPCODE_PARAMS.OFFSET]},      '>',      64),
            0x2e: ('jgt',      'jdstsrcoff',   {'output': ASM_OPCODE_PARAMS.JUMP, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.SRC, ASM_OPCODE_PARAMS.OFFSET]},      '>',      32),
            0x2f: ('mul',      'dstsrc',       {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.SRC]},                                 '*=',     64),
            0x30: ('ldabsb',   'ldabs',        {'output': None, 'inputs': []},                                                                                              None,      8),
            0x34: ('div32',    'dstimm',       {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.IMM]},                                 '/=',     32),
            0x35: ('jge',      'jdstimmoff',   {'output': ASM_OPCODE_PARAMS.JUMP, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.IMM, ASM_OPCODE_PARAMS.OFFSET]},      '>=',     64),
            0x37: ('div',      'dstimm',       {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.IMM]},                                 '/=',     64),
            0x38: ('ldabsdw',  'ldabs',        {'output': None, 'inputs': []},                                                                                              None,     64),
            0x3c: ('div32',    'dstsrc',       {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.SRC]},                                 '/=',     32),
            0x3d: ('jge',      'jdstsrcoff',   {'output': ASM_OPCODE_PARAMS.JUMP, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.SRC, ASM_OPCODE_PARAMS.OFFSET]},      '>=',     64),
            0x3f: ('div',      'dstsrc',       {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.SRC]},                                 '/=',     64),
            0x40: ('ldindw',   'ldind',        {'output': None, 'inputs': []},     None,     32),
            0x44: ('or32',     'dstimm',       {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.IMM]},                                 '|=',     32),
            0x45: ('jset',     'jdstimmoff',   {'output': ASM_OPCODE_PARAMS.JUMP, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.IMM, ASM_OPCODE_PARAMS.OFFSET]},      '&',      64),
            0x47: ('or',       'dstimm',       {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.IMM]},                                 '|=',     64),
            0x48: ('ldindh',   'ldind',        {'output': None, 'inputs': []},     None,     16),
            0x4c: ('or32',     'dstsrc',       {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.SRC]},                                 '|=',     32),
            0x4d: ('jset',     'jdstsrcoff',   {'output': ASM_OPCODE_PARAMS.JUMP, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.SRC, ASM_OPCODE_PARAMS.OFFSET]},      '&',      64),
            0x4f: ('or',       'dstsrc',       {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.SRC]},                                 '|=',     64),
            0x50: ('ldindb',   'ldind',        {'output': None, 'inputs': []},     None,      8),
            0x54: ('and32',    'dstimm',       {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.IMM]},                                 '&=',     32),
            0x55: ('jne',      'jdstimmoff',   {'output': ASM_OPCODE_PARAMS.JUMP, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.IMM, ASM_OPCODE_PARAMS.OFFSET]},      '!=',     64),
            0x56: ('jne',      'jdstimmoff',   {'output': ASM_OPCODE_PARAMS.JUMP, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.IMM, ASM_OPCODE_PARAMS.OFFSET]},      '!=',     32),
            0x57: ('and',      'dstimm',       {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.IMM]},                                 '&=',     64),
            0x58: ('ldinddw',  'ldind',        {'output': None, 'inputs': []},     None,     64),
            0x5c: ('and32',    'dstsrc',       {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.SRC]},                                 '&=',     32),
            0x5d: ('jne',      'jdstsrcoff',   {'output': ASM_OPCODE_PARAMS.JUMP, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.SRC, ASM_OPCODE_PARAMS.OFFSET]},      '!=',     64),
            0x5e: ('jne',      'jdstsrcoff',   {'output': ASM_OPCODE_PARAMS.JUMP, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.SRC, ASM_OPCODE_PARAMS.OFFSET]},      '!=',     32),
            0x5f: ('and',      'dstsrc',       {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.SRC]},                                 '&=',     64),
            0x61: ('ldxw',     'ldstsrcoff',   {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.SRC, ASM_OPCODE_PARAMS.OFFSET]},                              None,     32),
            0x62: ('stw',      'sdstoffimm',   {'output': None, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.OFFSET, ASM_OPCODE_PARAMS.IMM]},                        None,     32),
            0x63: ('stxw',     'sdstoffsrc',   {'output': None, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.OFFSET, ASM_OPCODE_PARAMS.SRC]},                        None,     32),
            0x64: ('lsh32',    'dstimm',       {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.IMM]},                                 '<<=',    32),
            0x65: ('jsgt',     'jdstimmoff',   {'output': ASM_OPCODE_PARAMS.JUMP, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.IMM, ASM_OPCODE_PARAMS.OFFSET]},      's>',     64),
            0x66: ('jsgt',     'jdstimmoff',   {'output': ASM_OPCODE_PARAMS.JUMP, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.IMM, ASM_OPCODE_PARAMS.OFFSET]},      's>',     32),
            0x67: ('lsh',      'dstimm',       {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.IMM]},                                 '<<=',    64),
            0x69: ('ldxh',     'ldstsrcoff',   {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.SRC, ASM_OPCODE_PARAMS.OFFSET]},                              None,     16),
            0x6a: ('sth',      'sdstoffimm',   {'output': None, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.OFFSET, ASM_OPCODE_PARAMS.IMM]},                        None,     16),
            0x6b: ('stxh',     'sdstoffsrc',   {'output': None, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.OFFSET, ASM_OPCODE_PARAMS.SRC]},                        None,     16),
            0x6c: ('lsh32',    'dstsrc',       {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.SRC]},                                 '<<=',    32),
            0x6d: ('jsgt',     'jdstsrcoff',   {'output': ASM_OPCODE_PARAMS.JUMP, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.SRC, ASM_OPCODE_PARAMS.OFFSET]},      's>',     64),
            0x6f: ('lsh',      'dstsrc',       {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.SRC]},                                 '<<=',    64),
            0x71: ('ldxb',     'ldstsrcoff',   {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.SRC, ASM_OPCODE_PARAMS.OFFSET]},                              None,      8),
            0x72: ('stb',      'sdstoffimm',   {'output': None, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.OFFSET, ASM_OPCODE_PARAMS.IMM]},                        None,      8),
            0x73: ('stxb',     'sdstoffsrc',   {'output': None, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.OFFSET, ASM_OPCODE_PARAMS.SRC]},                        None,      8),
            0x74: ('rsh32',    'dstimm',       {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.IMM]},                                 '>>=',    32),
            0x75: ('jsge',     'jdstimmoff',   {'output': ASM_OPCODE_PARAMS.JUMP, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.IMM, ASM_OPCODE_PARAMS.OFFSET]},      's>=',    64),
            0x77: ('rsh',      'dstimm',       {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.IMM]},                                 '>>=',    64),
            0x79: ('ldxdw',    'ldstsrcoff',   {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.SRC, ASM_OPCODE_PARAMS.OFFSET]},                              None,     64),
            0x7a: ('stdw',     'sdstoffimm',   {'output': None, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.OFFSET, ASM_OPCODE_PARAMS.IMM]},                        None,     64),
            0x7b: ('stxdw',    'sdstoffsrc',   {'output': None, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.OFFSET, ASM_OPCODE_PARAMS.SRC]},                        None,     64),
            0x7c: ('rsh32',    'dstsrc',       {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.SRC]},                                 '>>=',    32),
            0x7d: ('jsge',     'jdstsrcoff',   {'output': ASM_OPCODE_PARAMS.JUMP, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.SRC, ASM_OPCODE_PARAMS.OFFSET]},      's>=',    64),
            0x7f: ('rsh',      'dstsrc',       {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.SRC]},                                 '>>=',    64),
            0x84: ('neg32',    'dst',          {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.DST]},                                                        '~',      32),
            0x85: ('call',     'call',         {'output': ASM_OPCODE_PARAMS.JUMP, 'inputs': [ASM_OPCODE_PARAMS.IMM]},                                                       None,     64),
            0x87: ('neg',      'dst',          {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.DST]},                                                        '~',      64),
            0x94: ('mod32',    'dstimm',       {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.IMM]},                                 '%=',     32),
            0x95: ('exit',     'exit',         {'output': None, 'inputs': None},                                                                                            None,     64),
            0x97: ('mod',      'dstimm',       {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.IMM]},                                 '%=',     64),
            0x9c: ('mod32',    'dstsrc',       {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.SRC]},                                 '%=',     32),
            0x9f: ('mod',      'dstsrc',       {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.SRC]},                                 '%=',     64),
            0xa4: ('xor32',    'dstimm',       {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.IMM]},                                 '^=',     32),
            0xa5: ('jlt',      'jdstimmoff',   {'output': ASM_OPCODE_PARAMS.JUMP, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.IMM, ASM_OPCODE_PARAMS.OFFSET]},      '<',      64),
            0xa6: ('jlt',      'jdstimmoff',   {'output': ASM_OPCODE_PARAMS.JUMP, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.IMM, ASM_OPCODE_PARAMS.OFFSET]},      '<',      32),
            0xa7: ('xor',      'dstimm',       {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.IMM]},                                 '^=',     64),
            0xac: ('xor32',    'dstsrc',       {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.SRC]},                                 '^=',     32),
            0xad: ('jlt',      'jdstsrcoff',   {'output': ASM_OPCODE_PARAMS.JUMP, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.SRC, ASM_OPCODE_PARAMS.OFFSET]},      '<',      64),
            0xae: ('jlt',      'jdstsrcoff',   {'output': ASM_OPCODE_PARAMS.JUMP, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.SRC, ASM_OPCODE_PARAMS.OFFSET]},      '<',      32),
            0xaf: ('xor',      'dstsrc',       {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.SRC]},                                 '^=',     64),
            0xb4: ('mov32',    'dstimm',       {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.IMM]},                                                        '=',      32),
            0xb5: ('jle',      'jdstimmoff',   {'output': ASM_OPCODE_PARAMS.JUMP, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.IMM, ASM_OPCODE_PARAMS.OFFSET]},      '<=',     64),
            0xb7: ('mov',      'dstimm',       {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.IMM]},                                                        '=',      64),
            0xbc: ('mov32',    'dstsrc',       {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.SRC]},                                                        '=',      32),
            0xbd: ('jle',      'jdstsrcoff',   {'output': ASM_OPCODE_PARAMS.JUMP, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.SRC, ASM_OPCODE_PARAMS.OFFSET]},      '<=',     64),
            0xbf: ('mov',      'dstsrc',       {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.SRC]},                                                        '=',      64),
            0xc4: ('arsh32',   'dstimm',       {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.IMM]},                                 's>>=',   32),
            0xc5: ('jslt',     'jdstimmoff',   {'output': ASM_OPCODE_PARAMS.JUMP, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.IMM, ASM_OPCODE_PARAMS.OFFSET]},      's<',     64),
            0xc6: ('jslt',     'jdstimmoff',   {'output': ASM_OPCODE_PARAMS.JUMP, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.IMM, ASM_OPCODE_PARAMS.OFFSET]},      's<',     32),
            0xc7: ('arsh',     'dstimm',       {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.IMM]},                                 's>>=',   64),
            0xcc: ('arsh32',   'dstsrc',       {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.SRC]},                                 's>>=',   32),
            0xcd: ('jslt',     'jdstsrcoff',   {'output': ASM_OPCODE_PARAMS.JUMP, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.SRC, ASM_OPCODE_PARAMS.OFFSET]},      's<',     64),
            0xce: ('jslt',     'jdstsrcoff',   {'output': ASM_OPCODE_PARAMS.JUMP, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.SRC, ASM_OPCODE_PARAMS.OFFSET]},      's<',     32),
            0xcf: ('arsh',     'dstsrc',       {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.SRC]},                                 's>>=',   64),
            0xd3: ('atomic',   'sdstoffsrc',   {'output': None, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.OFFSET, ASM_OPCODE_PARAMS.SRC]},                        None,     32),
            0xd4: ('endxle',   'dstsrc',       {'output': ASM_OPCODE_PARAMS.DST, 'inputs': [ASM_OPCODE_PARAMS.DST]},                                                        'le',     64),
            0xd5: ('jsle',     'jdstimmoff',   {'output': ASM_OPCODE_PARAMS.JUMP, 'inputs': [ASM_OPCODE_PARAMS.DST, ASM_OPCODE_PARAMS.IMM, ASM_OPCODE_PARAMS.OFFSET]},     's<=',    64),
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
    hex_str: str
    opcodes_count = {}
    node_list = []
    action_edges = []
    carry_edges = []

    disasm_file = open(sys.argv[-1], "r")

    while True:
        # Find the next basic block
        if( find_block( disasm_file ) == ASM_FILE_READ.DATA_FOUND ):
            # gline_count = gline_count + 1
            # Block found -> process lines

            # process_lines( disasm_file )
            ret = process_lines( disasm_file )
            node_list = ret[0]
            action_edges = ret[1]
            carry_edges = ret[2]


            labels = {}
            for nodes in node_list:
                for node in nodes:
                    labels[node] = node.get_label()

            import matplotlib.pyplot as plt
            pos = nx.nx_agraph.graphviz_layout(G, prog="dot")
            nx.draw_networkx_nodes(G, pos, node_size=600)
            nx.draw_networkx_edges(G, pos, edgelist=carry_edges)
            nx.draw_networkx_edges(G, pos, edgelist=action_edges, edge_color=(0,0,1,1))
            nx.draw_networkx_labels(G, pos, labels, font_weight='bold')
            # nx.draw(G, pos=pos, labels=labels, with_labels=True, node_size=600, font_weight='bold')
            plt.show()
        else:
            break


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

def process_lines( f: TextIOWrapper ):
    global gline_count
    global labels
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
            return [nodes_all, action_edges, carry_edges]
        
        if asm_line.strip() == '':
            return [nodes_all, action_edges, carry_edges]

        hex_str = asm_line.split(':')[1].split('\t')

        if ( len(hex_str) != 3 ):
            print("ERROR")
            exit()
        
        # valid instruction found; begin procesing
        gline_count = gline_count + 1

        # # Generate new row of registers
        nodes_curr_lvl = []
        for idx in range(0, 11):
            nodes_curr_lvl.append(RegisterNode(idx, gline_count))
            G.add_node(nodes_curr_lvl[-1], level = nodes_curr_lvl[-1].get_level())
        
        # Add 'immediate' node
        if IMM_ENABLE:
            nodes_curr_lvl.append(ImmediateValueNode(gline_count))
            G.add_node(nodes_curr_lvl[-1], level = nodes_curr_lvl[-1].get_level())

        # Add new row to all nodes list
        nodes_all.append(nodes_curr_lvl)
        
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
        
        # Add edges to graph
        if( opcodes[hex_opcode][2]["output"] == ASM_OPCODE_PARAMS.DST ):
            ignore_reg = hex_reg_dst
        else:
            ignore_reg = -1

        for i in range(0, 11):
            if( i == ignore_reg ):
                for input in opcodes[hex_opcode][2]["inputs"]:
                        match input:
                            case ASM_OPCODE_PARAMS.DST:
                                G.add_edge(nodes_all[gline_count-1][hex_reg_dst-1], nodes_all[gline_count][hex_reg_dst-1])
                                action_edges.append((nodes_all[gline_count-1][hex_reg_dst], nodes_all[gline_count][hex_reg_dst]))
                            case ASM_OPCODE_PARAMS.SRC:
                                G.add_edge(nodes_all[gline_count-1][hex_reg_src-1], nodes_all[gline_count][hex_reg_dst-1])
                                action_edges.append((nodes_all[gline_count-1][hex_reg_src], nodes_all[gline_count][hex_reg_dst]))
                            case ASM_OPCODE_PARAMS.IMM:
                                if IMM_ENABLE:
                                    G.add_edge(nodes_all[gline_count-1][11], nodes_all[gline_count][hex_reg_dst])
                            case ASM_OPCODE_PARAMS.OFFSET:
                                if IMM_ENABLE:
                                    G.add_edge(nodes_all[gline_count-1][11], nodes_all[gline_count][hex_reg_dst])
                            case _:
                                print("ERROR")
                G.add_edge(nodes_all[gline_count-1][i], nodes_all[gline_count][i])
            else:
                G.add_edge(nodes_all[gline_count-1][i], nodes_all[gline_count][i])
                carry_edges.append((nodes_all[gline_count-1][i], nodes_all[gline_count][i]))


if __name__ == "__main__":
    main()