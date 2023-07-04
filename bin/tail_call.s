
./ebpf-samples/all/tail_call.o:	file format elf64-bpf

Disassembly of section xdp_prog:

0000000000000000 <caller>:
       0:	18 02 00 00 00 00 00 00 00 00 00 00 00 00 00 00	r2 = 0 ll
       2:	b7 03 00 00 00 00 00 00	r3 = 0
       3:	85 00 00 00 0c 00 00 00	call 12
       4:	95 00 00 00 00 00 00 00	exit

Disassembly of section xdp_prog/0:

0000000000000000 <callee>:
       0:	b7 00 00 00 2a 00 00 00	r0 = 42
       1:	95 00 00 00 00 00 00 00	exit
