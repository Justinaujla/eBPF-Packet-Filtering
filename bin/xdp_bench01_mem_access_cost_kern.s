
./ebpf-samples/all/xdp_bench01_mem_access_cost_kern.o:	file format elf64-bpf

Disassembly of section xdp_bench01:

0000000000000000 <xdp_prog>:
       0:	61 12 04 00 00 00 00 00	r2 = *(u32 *)(r1 + 4)
       1:	61 18 00 00 00 00 00 00	r8 = *(u32 *)(r1 + 0)
       2:	b7 01 00 00 00 00 00 00	r1 = 0
       3:	63 1a f8 ff 00 00 00 00	*(u32 *)(r10 - 8) = r1
       4:	b7 07 00 00 01 00 00 00	r7 = 1
       5:	bf 81 00 00 00 00 00 00	r1 = r8
       6:	07 01 00 00 0e 00 00 00	r1 += 14
       7:	2d 21 35 00 00 00 00 00	if r1 > r2 goto +53 <LBB0_12>
       8:	bf a2 00 00 00 00 00 00	r2 = r10
       9:	07 02 00 00 f8 ff ff ff	r2 += -8
      10:	18 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00	r1 = 0 ll
      12:	85 00 00 00 01 00 00 00	call 1
      13:	bf 06 00 00 00 00 00 00	r6 = r0
      14:	15 06 2e 00 00 00 00 00	if r6 == 0 goto +46 <LBB0_12>
      15:	bf a2 00 00 00 00 00 00	r2 = r10
      16:	07 02 00 00 f8 ff ff ff	r2 += -8
      17:	18 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00	r1 = 0 ll
      19:	85 00 00 00 01 00 00 00	call 1
      20:	15 00 1e 00 00 00 00 00	if r0 == 0 goto +30 <LBB0_9>
      21:	79 01 00 00 00 00 00 00	r1 = *(u64 *)(r0 + 0)
      22:	15 01 1c 00 00 00 00 00	if r1 == 0 goto +28 <LBB0_9>
      23:	bf 12 00 00 00 00 00 00	r2 = r1
      24:	57 02 00 00 01 00 00 00	r2 &= 1
      25:	15 02 09 00 00 00 00 00	if r2 == 0 goto +9 <LBB0_6>
      26:	71 82 0c 00 00 00 00 00	r2 = *(u8 *)(r8 + 12)
      27:	71 83 0d 00 00 00 00 00	r3 = *(u8 *)(r8 + 13)
      28:	67 03 00 00 08 00 00 00	r3 <<= 8
      29:	4f 23 00 00 00 00 00 00	r3 |= r2
      30:	6b 3a fe ff 00 00 00 00	*(u16 *)(r10 - 2) = r3
      31:	69 a2 fe ff 00 00 00 00	r2 = *(u16 *)(r10 - 2)
      32:	57 02 00 00 ff 00 00 00	r2 &= 255
      33:	b7 03 00 00 06 00 00 00	r3 = 6
      34:	2d 23 1a 00 00 00 00 00	if r3 > r2 goto +26 <LBB0_12>

0000000000000118 <LBB0_6>:
      35:	57 01 00 00 02 00 00 00	r1 &= 2
      36:	55 01 02 00 00 00 00 00	if r1 != 0 goto +2 <LBB0_8>
      37:	61 61 00 00 00 00 00 00	r1 = *(u32 *)(r6 + 0)
      38:	55 01 0c 00 03 00 00 00	if r1 != 3 goto +12 <LBB0_9>

0000000000000138 <LBB0_8>:
      39:	69 81 00 00 00 00 00 00	r1 = *(u16 *)(r8 + 0)
      40:	69 82 06 00 00 00 00 00	r2 = *(u16 *)(r8 + 6)
      41:	6b 28 00 00 00 00 00 00	*(u16 *)(r8 + 0) = r2
      42:	69 82 08 00 00 00 00 00	r2 = *(u16 *)(r8 + 8)
      43:	69 83 02 00 00 00 00 00	r3 = *(u16 *)(r8 + 2)
      44:	6b 38 08 00 00 00 00 00	*(u16 *)(r8 + 8) = r3
      45:	6b 28 02 00 00 00 00 00	*(u16 *)(r8 + 2) = r2
      46:	69 82 0a 00 00 00 00 00	r2 = *(u16 *)(r8 + 10)
      47:	69 83 04 00 00 00 00 00	r3 = *(u16 *)(r8 + 4)
      48:	6b 38 0a 00 00 00 00 00	*(u16 *)(r8 + 10) = r3
      49:	6b 28 04 00 00 00 00 00	*(u16 *)(r8 + 4) = r2
      50:	6b 18 06 00 00 00 00 00	*(u16 *)(r8 + 6) = r1

0000000000000198 <LBB0_9>:
      51:	bf a2 00 00 00 00 00 00	r2 = r10
      52:	07 02 00 00 f8 ff ff ff	r2 += -8
      53:	18 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00	r1 = 0 ll
      55:	85 00 00 00 01 00 00 00	call 1
      56:	15 00 03 00 00 00 00 00	if r0 == 0 goto +3 <LBB0_11>
      57:	79 01 00 00 00 00 00 00	r1 = *(u64 *)(r0 + 0)
      58:	07 01 00 00 01 00 00 00	r1 += 1
      59:	7b 10 00 00 00 00 00 00	*(u64 *)(r0 + 0) = r1

00000000000001e0 <LBB0_11>:
      60:	61 67 00 00 00 00 00 00	r7 = *(u32 *)(r6 + 0)

00000000000001e8 <LBB0_12>:
      61:	bf 70 00 00 00 00 00 00	r0 = r7
      62:	95 00 00 00 00 00 00 00	exit
