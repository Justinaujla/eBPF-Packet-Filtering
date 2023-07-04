
./ebpf-samples/all/mapoverflow.o:	file format elf64-bpf

Disassembly of section .text:

0000000000000000 <func>:
       0:	b7 01 00 00 0a 00 00 00	r1 = 10
       1:	63 1a fc ff 00 00 00 00	*(u32 *)(r10 - 4) = r1
       2:	b7 01 00 00 00 00 00 00	r1 = 0
       3:	7b 1a f0 ff 00 00 00 00	*(u64 *)(r10 - 16) = r1
       4:	bf a2 00 00 00 00 00 00	r2 = r10
       5:	07 02 00 00 fc ff ff ff	r2 += -4
       6:	bf a3 00 00 00 00 00 00	r3 = r10
       7:	07 03 00 00 f0 ff ff ff	r3 += -16
       8:	18 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00	r1 = 0 ll
      10:	b7 04 00 00 00 00 00 00	r4 = 0
      11:	85 00 00 00 02 00 00 00	call 2
      12:	95 00 00 00 00 00 00 00	exit
