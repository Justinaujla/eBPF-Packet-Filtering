
./ebpf-samples/all/badrelo.o:	file format elf64-bpf

Disassembly of section .text:

0000000000000000 <func>:
       0:	18 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00	r1 = 0 ll
       2:	b7 02 00 00 00 00 00 00	r2 = 0
       3:	b7 03 00 00 00 00 00 00	r3 = 0
       4:	b7 04 00 00 00 00 00 00	r4 = 0
       5:	85 10 00 00 ff ff ff ff	call -1
       6:	95 00 00 00 00 00 00 00	exit
