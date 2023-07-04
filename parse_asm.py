import sys
from pathlib import Path
import json

import networkx as nx
import matplotlib.pyplot as plt


class RegisterNode:
    def __init__(self, register_name):
        self.register_name = register_name

# name, opclass, op, bits
# note: byte swap bits depends on immediate, nothing in opcode
# todo: atomic opcode needs further breakdown into add, or, and, xor based on immediate
opcodes = {0x04: ('add32',    'dstimm',     '+=',     32),
            0x05: ('ja',       'joff',       None,     64),
            0x07: ('add',      'dstimm',     '+=',     64),
            0x0c: ('add32',    'dstsrc',     '+=',     32),
            0x0f: ('add',      'dstsrc',     '+=',     64),
            0x14: ('sub32',    'dstimm',     '-=',     32),
            0x15: ('jeq',      'jdstimmoff', '==',     64),
            0x16: ('jeq',      'jdstimmoff', '==',     32),
            0x17: ('sub',      'dstimm',     '-=',     64),
            0x18: ('lddw',     'lddw',       None,     64),
            0x1c: ('sub32',    'dstsrc',     '-=',     32),
            0x1d: ('jeq',      'jdstsrcoff', '==',     64),
            0x1e: ('jeq',      'jdstsrcoff', '==',     32),
            0x1f: ('sub',      'dstsrc',     '-=',     64),
            0x20: ('ldabsw',   'ldabs',      None,     32),
            0x24: ('mul32',    'dstimm',     '*=',     32),
            0x25: ('jgt',      'jdstimmoff', '>',      64),
            0x26: ('jgt32',    'jdstimmoff', '>',      32),
            0x27: ('mul',      'dstimm',     '*=',     64),
            0x28: ('ldabsh',   'ldabs',      None,     16),
            0x2c: ('mul32',    'dstsrc',     '*=',     32),
            0x2d: ('jgt',      'jdstsrcoff', '>',      64),
            0x2e: ('jgt',      'jdstsrcoff', '>',      32),
            0x2f: ('mul',      'dstsrc',     '*=',     64),
            0x30: ('ldabsb',   'ldabs',      None,      8),
            0x34: ('div32',    'dstimm',     '/=',     32),
            0x35: ('jge',      'jdstimmoff', '>=',     64),
            0x37: ('div',      'dstimm',     '/=',     64),
            0x38: ('ldabsdw',  'ldabs',      None,     64),
            0x3c: ('div32',    'dstsrc',     '/=',     32),
            0x3d: ('jge',      'jdstsrcoff', '>=',     64),
            0x3f: ('div',      'dstsrc',     '/=',     64),
            0x40: ('ldindw',   'ldind',      None,     32),
            0x44: ('or32',     'dstimm_bw',  '|=',     32),
            0x45: ('jset',     'jdstimmoff', '&',      64),
            0x47: ('or',       'dstimm_bw',  '|=',     64),
            0x48: ('ldindh',   'ldind',      None,     16),
            0x4c: ('or32',     'dstsrc',     '|=',     32),
            0x4d: ('jset',     'jdstsrcoff', '&',      64),
            0x4f: ('or',       'dstsrc',     '|=',     64),
            0x50: ('ldindb',   'ldind',      None,      8),
            0x54: ('and32',    'dstimm_bw',  '&=',     32),
            0x55: ('jne',      'jdstimmoff', '!=',     64),
            0x56: ('jne',      'jdstimmoff', '!=',     32),
            0x57: ('and',      'dstimm_bw',  '&=',     64),
            0x58: ('ldinddw',  'ldind',      None,     64),
            0x5c: ('and32',    'dstsrc',     '&=',     32),
            0x5d: ('jne',      'jdstsrcoff', '!=',     64),
            0x5e: ('jne',      'jdstsrcoff', '!=',     32),
            0x5f: ('and',      'dstsrc',     '&=',     64),
            0x61: ('ldxw',     'ldstsrcoff', None,     32),
            0x62: ('stw',      'sdstoffimm', None,     32),
            0x63: ('stxw',     'sdstoffsrc', None,     32),
            0x64: ('lsh32',    'dstimm',     '<<=',    32),
            0x65: ('jsgt',     'jdstimmoff', 's>',     64),
            0x66: ('jsgt',     'jdstimmoff', 's>',     32),
            0x67: ('lsh',      'dstimm',     '<<=',    64),
            0x69: ('ldxh',     'ldstsrcoff', None,     16),
            0x6a: ('sth',      'sdstoffimm', None,     16),
            0x6b: ('stxh',     'sdstoffsrc', None,     16),
            0x6c: ('lsh32',    'dstsrc',     '<<=',    32),
            0x6d: ('jsgt',     'jdstsrcoff', 's>',     64),
            0x6f: ('lsh',      'dstsrc',     '<<=',    64),
            0x71: ('ldxb',     'ldstsrcoff', None,      8),
            0x72: ('stb',      'sdstoffimm', None,      8),
            0x73: ('stxb',     'sdstoffsrc', None,      8),
            0x74: ('rsh32',    'dstimm',     '>>=',    32),
            0x75: ('jsge',     'jdstimmoff', 's>=',    64),
            0x77: ('rsh',      'dstimm',     '>>=',    64),
            0x79: ('ldxdw',    'ldstsrcoff', None,     64),
            0x7a: ('stdw',     'sdstoffimm', None,     64),
            0x7b: ('stxdw',    'sdstoffsrc', None,     64),
            0x7c: ('rsh32',    'dstsrc',     '>>=',    32),
            0x7d: ('jsge',     'jdstsrcoff', 's>=',    64),
            0x7f: ('rsh',      'dstsrc',     '>>=',    64),
            0x84: ('neg32',    'dst',        '~',      32),
            0x85: ('call',     'call',       None,     64),
            0x87: ('neg',      'dst',        '~',      64),
            0x94: ('mod32',    'dstimm',     '%=',     32),
            0x95: ('exit',     'exit',       None,     64),
            0x97: ('mod',      'dstimm',     '%=',     64),
            0x9c: ('mod32',    'dstsrc',     '%=',     32),
            0x9f: ('mod',      'dstsrc',     '%=',     64),
            0xa4: ('xor32',    'dstimm_bw',  '^=',     32),
            0xa5: ('jlt',      'jdstimmoff', '<',      64),
            0xa6: ('jlt',      'jdstimmoff', '<',      32),
            0xa7: ('xor',      'dstimm_bw',  '^=',     64),
            0xac: ('xor32',    'dstsrc',     '^=',     32),
            0xad: ('jlt',      'jdstsrcoff', '<',      64),
            0xae: ('jlt',      'jdstsrcoff', '<',      32),
            0xaf: ('xor',      'dstsrc',     '^=',     64),
            0xb4: ('mov32',    'dstimm',     '=',      32),
            0xb5: ('jle',      'jdstimmoff', '<=',     64),
            0xb7: ('mov',      'dstimm',     '=',      64),
            0xbc: ('mov32',    'dstsrc',     '=',      32),
            0xbd: ('jle',      'jdstsrcoff', '<=',     64),
            0xbf: ('mov',      'dstsrc',     '=',      64),
            0xc4: ('arsh32',   'dstimm',     's>>=',   32),
            0xc5: ('jslt',     'jdstimmoff', 's<',     64),
            0xc6: ('jslt',     'jdstimmoff', 's<',     32),
            0xc7: ('arsh',     'dstimm',     's>>=',   64),
            0xcc: ('arsh32',   'dstsrc',     's>>=',   32),
            0xcd: ('jslt',     'jdstsrcoff', 's<',     64),
            0xce: ('jslt',     'jdstsrcoff', 's<',     32),
            0xcf: ('arsh',     'dstsrc',     's>>=',   64),
            0xd3: ('atomic',   'dstsrc',     None,     32),
            0xd4: ('endxle',   'jdstimmoff', 'le',     64),
            0xd5: ('jsle',     'jdstimmoff', 's<=',    64),
            0xdb: ('atomic',   'dstsrc',     None,     64),
            0xdc: ('endxbe',   'dstsrc',     'be',     64),
            0xdd: ('jsle',     'jdstimmoff', 's<=',    64),}

def main():
    diss_asm: str
    hex_str: str
    opcodes_count = {}
    G = nx.MultiDiGraph()
    line_count = 0

    with open(sys.argv[-1], "r") as f:
        diss_asm = f.read()

    for line in diss_asm.split('\n'):
        line_count += 1

        if line.strip() == '':
            continue
        hex_str = line.split(':')[1].split('\t')

        if ( len(hex_str) != 3 ):
            continue

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

        if(opcodes[hex_opcode][2]):
            print("r" + str(hex_reg_dst) + " " + str(opcodes[hex_opcode][2]) + " " + "r" + str(hex_reg_src))
            G.add_node("r" + str(hex_reg_dst))
            G.add_node("r" + str(hex_reg_src))
            G.add_node(str(opcodes[hex_opcode][2]))
            G.add_edge("r" + str(hex_reg_src), str(opcodes[hex_opcode][2]))
            G.add_edge(str(opcodes[hex_opcode][2]), "r" + str(hex_reg_dst))
        else:
            print(str(hex_reg_dst) + ", " + str(opcodes[hex_opcode][2]) + ", " + str(hex_reg_src))


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

    pos = nx.spring_layout(G)
    nx.draw_networkx_nodes(G, pos)
    nx.draw_networkx_edges(G, pos)
    nx.draw_networkx_labels(G, pos)
    plt.show()

        

if __name__ == "__main__":
    main()