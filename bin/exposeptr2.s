
./ebpf-samples/all/exposeptr2.o:	file format elf64-bpf

Disassembly of section .text:

0000000000000000 <func>:
       0:	7b 1a f8 ff 00 00 00 00	*(u64 *)(r10 - 8) = r1
       1:	b7 01 00 00 00 00 00 00	r1 = 0
       2:	63 1a f4 ff 00 00 00 00	*(u32 *)(r10 - 12) = r1
       3:	bf a2 00 00 00 00 00 00	r2 = r10
       4:	07 02 00 00 f8 ff ff ff	r2 += -8
       5:	bf a3 00 00 00 00 00 00	r3 = r10
       6:	07 03 00 00 f4 ff ff ff	r3 += -12
       7:	18 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00	r1 = 0 ll
       9:	b7 04 00 00 00 00 00 00	r4 = 0
      10:	85 00 00 00 02 00 00 00	call 2
      11:	95 00 00 00 00 00 00 00	exit
