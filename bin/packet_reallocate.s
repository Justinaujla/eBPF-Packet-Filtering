
./ebpf-samples/all/packet_reallocate.o:	file format elf64-bpf

Disassembly of section socket_filter:

0000000000000000 <reallocate_invalidates>:
       0:	b7 06 00 00 01 00 00 00	r6 = 1
       1:	61 12 50 00 00 00 00 00	r2 = *(u32 *)(r1 + 80)
       2:	61 17 4c 00 00 00 00 00	r7 = *(u32 *)(r1 + 76)
       3:	bf 73 00 00 00 00 00 00	r3 = r7
       4:	07 03 00 00 04 00 00 00	r3 += 4
       5:	2d 23 0a 00 00 00 00 00	if r3 > r2 goto +10 <LBB0_2>
       6:	61 72 00 00 00 00 00 00	r2 = *(u32 *)(r7 + 0)
       7:	07 02 00 00 01 00 00 00	r2 += 1
       8:	63 27 00 00 00 00 00 00	*(u32 *)(r7 + 0) = r2
       9:	b7 06 00 00 00 00 00 00	r6 = 0
      10:	b7 02 00 00 04 00 00 00	r2 = 4
      11:	b7 03 00 00 00 00 00 00	r3 = 0
      12:	85 00 00 00 2b 00 00 00	call 43
      13:	61 71 00 00 00 00 00 00	r1 = *(u32 *)(r7 + 0)
      14:	07 01 00 00 01 00 00 00	r1 += 1
      15:	63 17 00 00 00 00 00 00	*(u32 *)(r7 + 0) = r1

0000000000000080 <LBB0_2>:
      16:	bf 60 00 00 00 00 00 00	r0 = r6
      17:	95 00 00 00 00 00 00 00	exit