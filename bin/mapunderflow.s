
./ebpf-samples/all/mapunderflow.o:	file format elf64-bpf

Disassembly of section .text:

0000000000000000 <func>:
       0:	18 01 00 00 ff ff ff ff 00 00 00 00 00 00 00 00	r1 = 4294967295 ll
       2:	63 1a fc ff 00 00 00 00	*(u32 *)(r10 - 4) = r1
       3:	b7 01 00 00 00 00 00 00	r1 = 0
       4:	7b 1a f0 ff 00 00 00 00	*(u64 *)(r10 - 16) = r1
       5:	bf a2 00 00 00 00 00 00	r2 = r10
       6:	07 02 00 00 fc ff ff ff	r2 += -4
       7:	bf a3 00 00 00 00 00 00	r3 = r10
       8:	07 03 00 00 f0 ff ff ff	r3 += -16
       9:	18 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00	r1 = 0 ll
      11:	b7 04 00 00 00 00 00 00	r4 = 0
      12:	85 00 00 00 02 00 00 00	call 2
      13:	95 00 00 00 00 00 00 00	exit
