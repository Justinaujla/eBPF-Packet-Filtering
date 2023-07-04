import sys
from pathlib import Path
import json

def main():
    files: str
    opcodes_count = {}

    with open(sys.argv[-1], "r") as f:
        files = f.read()
    f.close()

    for line in files.split('\n'):
        if line.strip() == '':
            continue
        with open(line, "r") as f:
            jsonObj = json.loads(f.read())
            for entry in jsonObj:
                if entry in opcodes_count:
                    opcodes_count[entry] += jsonObj[entry]
                else:
                    opcodes_count[entry] = 1
        # close the current file
        f.close()

    sorted_opcode_count = dict(sorted(opcodes_count.items(), key=lambda x:x[1], reverse=True))
    print(sorted_opcode_count)
    sum = 0
    for entry in sorted_opcode_count:
        sum += sorted_opcode_count[entry]
    print("Total Instr Count: " + str(sum))

    # create new dict of percentages
    opcodes_percent = {}
    for entry in sorted_opcode_count:
        opcodes_percent[entry] = sorted_opcode_count[entry]/sum

    print(opcodes_percent)

if __name__ == "__main__":
    main()