
./ebpf-samples/all/ctxoffset.o:	file format elf64-bpf

Disassembly of section sockops:

0000000000000000 <func>:
       0:	b7 02 00 00 01 00 00 00	r2 = 1
       1:	63 2a fc ff 00 00 00 00	*(u32 *)(r10 - 4) = r2
       2:	07 01 00 00 08 00 00 00	r1 += 8
       3:	bf a3 00 00 00 00 00 00	r3 = r10
       4:	07 03 00 00 fc ff ff ff	r3 += -4
       5:	18 02 00 00 00 00 00 00 00 00 00 00 00 00 00 00	r2 = 0 ll
       7:	b7 04 00 00 00 00 00 00	r4 = 0
       8:	85 00 00 00 35 00 00 00	call 53
       9:	95 00 00 00 00 00 00 00	exit
