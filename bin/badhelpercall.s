
./ebpf-samples/all/badhelpercall.o:	file format elf64-bpf

Disassembly of section .text:

0000000000000000 <func>:
       0:	bf a1 00 00 00 00 00 00	r1 = r10
       1:	07 01 00 00 ff ff ff ff	r1 += -1
       2:	b7 02 00 00 14 00 00 00	r2 = 20
       3:	85 00 00 00 10 00 00 00	call 16
       4:	95 00 00 00 00 00 00 00	exit
