
./ebpf-samples/all/tcp_cong_kern.o:	file format elf64-bpf

Disassembly of section sockops:

0000000000000000 <bpf_cong>:
       0:	bf 16 00 00 00 00 00 00	r6 = r1
       1:	b7 01 00 00 70 00 00 00	r1 = 112
       2:	6b 1a fc ff 00 00 00 00	*(u16 *)(r10 - 4) = r1
       3:	b7 01 00 00 64 63 74 63	r1 = 1668572004
       4:	63 1a f8 ff 00 00 00 00	*(u32 *)(r10 - 8) = r1
       5:	61 61 40 00 00 00 00 00	r1 = *(u32 *)(r6 + 64)
       6:	15 01 04 00 00 00 d9 31	if r1 == 836304896 goto +4 <LBB0_2>
       7:	18 07 00 00 ff ff ff ff 00 00 00 00 00 00 00 00	r7 = 4294967295 ll
       9:	61 61 44 00 00 00 00 00	r1 = *(u32 *)(r6 + 68)
      10:	55 01 39 00 31 d9 00 00	if r1 != 55601 goto +57 <LBB0_11>

0000000000000058 <LBB0_2>:
      11:	61 68 00 00 00 00 00 00	r8 = *(u32 *)(r6 + 0)
      12:	b7 01 00 00 00 00 00 00	r1 = 0
      13:	73 1a f0 ff 00 00 00 00	*(u8 *)(r10 - 16) = r1
      14:	18 01 00 00 61 6e 64 3a 00 00 00 00 20 25 64 0a	r1 = 748764258399186529 ll
      16:	7b 1a e8 ff 00 00 00 00	*(u64 *)(r10 - 24) = r1
      17:	18 01 00 00 42 50 46 20 00 00 00 00 63 6f 6d 6d	r1 = 7885080994129530946 ll
      19:	7b 1a e0 ff 00 00 00 00	*(u64 *)(r10 - 32) = r1
      20:	bf a1 00 00 00 00 00 00	r1 = r10
      21:	07 01 00 00 e0 ff ff ff	r1 += -32
      22:	b7 02 00 00 11 00 00 00	r2 = 17
      23:	bf 83 00 00 00 00 00 00	r3 = r8
      24:	85 00 00 00 06 00 00 00	call 6
      25:	61 61 14 00 00 00 00 00	r1 = *(u32 *)(r6 + 20)
      26:	18 07 00 00 ff ff ff ff 00 00 00 00 00 00 00 00	r7 = 4294967295 ll
      28:	55 01 1b 00 0a 00 00 00	if r1 != 10 goto +27 <LBB0_10>
      29:	61 61 20 00 00 00 00 00	r1 = *(u32 *)(r6 + 32)
      30:	61 62 30 00 00 00 00 00	r2 = *(u32 *)(r6 + 48)
      31:	18 07 00 00 ff ff ff ff 00 00 00 00 00 00 00 00	r7 = 4294967295 ll
      33:	5d 12 16 00 00 00 00 00	if r2 != r1 goto +22 <LBB0_10>
      34:	61 61 34 00 00 00 00 00	r1 = *(u32 *)(r6 + 52)
      35:	61 62 24 00 00 00 00 00	r2 = *(u32 *)(r6 + 36)
      36:	af 12 00 00 00 00 00 00	r2 ^= r1
      37:	57 02 00 00 ff f0 00 00	r2 &= 61695
      38:	18 07 00 00 ff ff ff ff 00 00 00 00 00 00 00 00	r7 = 4294967295 ll
      40:	55 02 0f 00 00 00 00 00	if r2 != 0 goto +15 <LBB0_10>
      41:	b7 07 00 00 01 00 00 00	r7 = 1
      42:	15 08 0d 00 06 00 00 00	if r8 == 6 goto +13 <LBB0_10>
      43:	15 08 01 00 05 00 00 00	if r8 == 5 goto +1 <LBB0_8>
      44:	55 08 09 00 04 00 00 00	if r8 != 4 goto +9 <LBB0_9>

0000000000000168 <LBB0_8>:
      45:	bf a4 00 00 00 00 00 00	r4 = r10
      46:	07 04 00 00 f8 ff ff ff	r4 += -8
      47:	bf 61 00 00 00 00 00 00	r1 = r6
      48:	b7 02 00 00 06 00 00 00	r2 = 6
      49:	b7 03 00 00 0d 00 00 00	r3 = 13
      50:	b7 05 00 00 06 00 00 00	r5 = 6
      51:	85 00 00 00 31 00 00 00	call 49
      52:	bf 07 00 00 00 00 00 00	r7 = r0
      53:	05 00 02 00 00 00 00 00	goto +2 <LBB0_10>

00000000000001b0 <LBB0_9>:
      54:	18 07 00 00 ff ff ff ff 00 00 00 00 00 00 00 00	r7 = 4294967295 ll

00000000000001c0 <LBB0_10>:
      56:	b7 01 00 00 0a 00 00 00	r1 = 10
      57:	6b 1a ec ff 00 00 00 00	*(u16 *)(r10 - 20) = r1
      58:	b7 01 00 00 67 20 25 64	r1 = 1680154727
      59:	63 1a e8 ff 00 00 00 00	*(u32 *)(r10 - 24) = r1
      60:	18 01 00 00 52 65 74 75 00 00 00 00 72 6e 69 6e	r1 = 7956011654602581330 ll
      62:	7b 1a e0 ff 00 00 00 00	*(u64 *)(r10 - 32) = r1
      63:	bf a1 00 00 00 00 00 00	r1 = r10
      64:	07 01 00 00 e0 ff ff ff	r1 += -32
      65:	b7 02 00 00 0e 00 00 00	r2 = 14
      66:	bf 73 00 00 00 00 00 00	r3 = r7
      67:	85 00 00 00 06 00 00 00	call 6

0000000000000220 <LBB0_11>:
      68:	63 76 04 00 00 00 00 00	*(u32 *)(r6 + 4) = r7
      69:	b7 00 00 00 01 00 00 00	r0 = 1
      70:	95 00 00 00 00 00 00 00	exit
