
./ebpf-samples/all/xdp_rxq_info_kern.o:	file format elf64-bpf

Disassembly of section xdp_prog0:

0000000000000000 <xdp_prognum0>:
       0:	bf 18 00 00 00 00 00 00	r8 = r1
       1:	61 81 00 00 00 00 00 00	r1 = *(u32 *)(r8 + 0)
       2:	7b 1a f0 ff 00 00 00 00	*(u64 *)(r10 - 16) = r1
       3:	61 81 04 00 00 00 00 00	r1 = *(u32 *)(r8 + 4)
       4:	7b 1a e8 ff 00 00 00 00	*(u64 *)(r10 - 24) = r1
       5:	b7 06 00 00 00 00 00 00	r6 = 0
       6:	63 6a fc ff 00 00 00 00	*(u32 *)(r10 - 4) = r6
       7:	bf a2 00 00 00 00 00 00	r2 = r10
       8:	07 02 00 00 fc ff ff ff	r2 += -4
       9:	18 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00	r1 = 0 ll
      11:	85 00 00 00 01 00 00 00	call 1
      12:	bf 09 00 00 00 00 00 00	r9 = r0
      13:	15 09 41 00 00 00 00 00	if r9 == 0 goto +65 <LBB0_15>
      14:	79 91 00 00 00 00 00 00	r1 = *(u64 *)(r9 + 0)
      15:	07 01 00 00 01 00 00 00	r1 += 1
      16:	7b 19 00 00 00 00 00 00	*(u64 *)(r9 + 0) = r1
      17:	61 87 0c 00 00 00 00 00	r7 = *(u32 *)(r8 + 12)
      18:	bf a2 00 00 00 00 00 00	r2 = r10
      19:	07 02 00 00 fc ff ff ff	r2 += -4
      20:	18 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00	r1 = 0 ll
      22:	85 00 00 00 01 00 00 00	call 1
      23:	15 00 37 00 00 00 00 00	if r0 == 0 goto +55 <LBB0_15>
      24:	61 01 04 00 00 00 00 00	r1 = *(u32 *)(r0 + 4)
      25:	1d 17 04 00 00 00 00 00	if r7 == r1 goto +4 <LBB0_4>
      26:	79 91 08 00 00 00 00 00	r1 = *(u64 *)(r9 + 8)
      27:	07 01 00 00 01 00 00 00	r1 += 1
      28:	7b 19 08 00 00 00 00 00	*(u64 *)(r9 + 8) = r1
      29:	05 00 31 00 00 00 00 00	goto +49 <LBB0_15>

00000000000000f0 <LBB0_4>:
      30:	bf 07 00 00 00 00 00 00	r7 = r0
      31:	61 81 10 00 00 00 00 00	r1 = *(u32 *)(r8 + 16)
      32:	b7 02 00 00 40 00 00 00	r2 = 64
      33:	2d 12 01 00 00 00 00 00	if r2 > r1 goto +1 <LBB0_6>
      34:	b7 01 00 00 40 00 00 00	r1 = 64

0000000000000118 <LBB0_6>:
      35:	63 1a fc ff 00 00 00 00	*(u32 *)(r10 - 4) = r1
      36:	bf a2 00 00 00 00 00 00	r2 = r10
      37:	07 02 00 00 fc ff ff ff	r2 += -4
      38:	18 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00	r1 = 0 ll
      40:	85 00 00 00 01 00 00 00	call 1
      41:	bf 75 00 00 00 00 00 00	r5 = r7
      42:	15 00 24 00 00 00 00 00	if r0 == 0 goto +36 <LBB0_15>
      43:	79 01 00 00 00 00 00 00	r1 = *(u64 *)(r0 + 0)
      44:	07 01 00 00 01 00 00 00	r1 += 1
      45:	7b 10 00 00 00 00 00 00	*(u64 *)(r0 + 0) = r1
      46:	61 a1 fc ff 00 00 00 00	r1 = *(u32 *)(r10 - 4)
      47:	55 01 03 00 40 00 00 00	if r1 != 64 goto +3 <LBB0_9>
      48:	79 01 08 00 00 00 00 00	r1 = *(u64 *)(r0 + 8)
      49:	07 01 00 00 01 00 00 00	r1 += 1
      50:	7b 10 08 00 00 00 00 00	*(u64 *)(r0 + 8) = r1

0000000000000198 <LBB0_9>:
      51:	61 51 08 00 00 00 00 00	r1 = *(u32 *)(r5 + 8)
      52:	bf 12 00 00 00 00 00 00	r2 = r1
      53:	57 02 00 00 03 00 00 00	r2 &= 3
      54:	15 02 17 00 00 00 00 00	if r2 == 0 goto +23 <LBB0_14>
      55:	79 a2 f0 ff 00 00 00 00	r2 = *(u64 *)(r10 - 16)
      56:	07 02 00 00 0e 00 00 00	r2 += 14
      57:	79 a3 e8 ff 00 00 00 00	r3 = *(u64 *)(r10 - 24)
      58:	2d 32 14 00 00 00 00 00	if r2 > r3 goto +20 <LBB0_15>
      59:	79 a2 f0 ff 00 00 00 00	r2 = *(u64 *)(r10 - 16)
      60:	71 22 0c 00 00 00 00 00	r2 = *(u8 *)(r2 + 12)
      61:	b7 03 00 00 06 00 00 00	r3 = 6
      62:	2d 23 10 00 00 00 00 00	if r3 > r2 goto +16 <LBB0_15>
      63:	57 01 00 00 02 00 00 00	r1 &= 2
      64:	15 01 0d 00 00 00 00 00	if r1 == 0 goto +13 <LBB0_14>
      65:	79 a4 f0 ff 00 00 00 00	r4 = *(u64 *)(r10 - 16)
      66:	69 41 00 00 00 00 00 00	r1 = *(u16 *)(r4 + 0)
      67:	69 42 06 00 00 00 00 00	r2 = *(u16 *)(r4 + 6)
      68:	6b 24 00 00 00 00 00 00	*(u16 *)(r4 + 0) = r2
      69:	69 42 08 00 00 00 00 00	r2 = *(u16 *)(r4 + 8)
      70:	69 43 02 00 00 00 00 00	r3 = *(u16 *)(r4 + 2)
      71:	6b 34 08 00 00 00 00 00	*(u16 *)(r4 + 8) = r3
      72:	6b 24 02 00 00 00 00 00	*(u16 *)(r4 + 2) = r2
      73:	69 42 0a 00 00 00 00 00	r2 = *(u16 *)(r4 + 10)
      74:	69 43 04 00 00 00 00 00	r3 = *(u16 *)(r4 + 4)
      75:	6b 34 0a 00 00 00 00 00	*(u16 *)(r4 + 10) = r3
      76:	6b 24 04 00 00 00 00 00	*(u16 *)(r4 + 4) = r2
      77:	6b 14 06 00 00 00 00 00	*(u16 *)(r4 + 6) = r1

0000000000000270 <LBB0_14>:
      78:	61 56 00 00 00 00 00 00	r6 = *(u32 *)(r5 + 0)

0000000000000278 <LBB0_15>:
      79:	bf 60 00 00 00 00 00 00	r0 = r6
      80:	95 00 00 00 00 00 00 00	exit
