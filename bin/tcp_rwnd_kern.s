
./ebpf-samples/all/tcp_rwnd_kern.o:	file format elf64-bpf

Disassembly of section sockops:

0000000000000000 <bpf_rwnd>:
       0:	bf 16 00 00 00 00 00 00	r6 = r1
       1:	61 61 40 00 00 00 00 00	r1 = *(u32 *)(r6 + 64)
       2:	15 01 04 00 00 00 d9 31	if r1 == 836304896 goto +4 <LBB0_2>
       3:	18 07 00 00 ff ff ff ff 00 00 00 00 00 00 00 00	r7 = 4294967295 ll
       5:	61 61 44 00 00 00 00 00	r1 = *(u32 *)(r6 + 68)
       6:	55 01 28 00 31 d9 00 00	if r1 != 55601 goto +40 <LBB0_8>

0000000000000038 <LBB0_2>:
       7:	61 68 00 00 00 00 00 00	r8 = *(u32 *)(r6 + 0)
       8:	b7 01 00 00 00 00 00 00	r1 = 0
       9:	73 1a f0 ff 00 00 00 00	*(u8 *)(r10 - 16) = r1
      10:	18 01 00 00 61 6e 64 3a 00 00 00 00 20 25 64 0a	r1 = 748764258399186529 ll
      12:	7b 1a e8 ff 00 00 00 00	*(u64 *)(r10 - 24) = r1
      13:	18 01 00 00 42 50 46 20 00 00 00 00 63 6f 6d 6d	r1 = 7885080994129530946 ll
      15:	7b 1a e0 ff 00 00 00 00	*(u64 *)(r10 - 32) = r1
      16:	bf a1 00 00 00 00 00 00	r1 = r10
      17:	07 01 00 00 e0 ff ff ff	r1 += -32
      18:	b7 02 00 00 11 00 00 00	r2 = 17
      19:	bf 83 00 00 00 00 00 00	r3 = r8
      20:	85 00 00 00 06 00 00 00	call 6
      21:	18 07 00 00 ff ff ff ff 00 00 00 00 00 00 00 00	r7 = 4294967295 ll
      23:	55 08 0b 00 02 00 00 00	if r8 != 2 goto +11 <LBB0_7>
      24:	61 61 14 00 00 00 00 00	r1 = *(u32 *)(r6 + 20)
      25:	55 01 09 00 0a 00 00 00	if r1 != 10 goto +9 <LBB0_7>
      26:	61 61 20 00 00 00 00 00	r1 = *(u32 *)(r6 + 32)
      27:	61 62 30 00 00 00 00 00	r2 = *(u32 *)(r6 + 48)
      28:	5d 12 05 00 00 00 00 00	if r2 != r1 goto +5 <LBB0_6>
      29:	61 61 34 00 00 00 00 00	r1 = *(u32 *)(r6 + 52)
      30:	61 62 24 00 00 00 00 00	r2 = *(u32 *)(r6 + 36)
      31:	af 12 00 00 00 00 00 00	r2 ^= r1
      32:	57 02 00 00 ff ff f0 00	r2 &= 15794175
      33:	15 02 01 00 00 00 00 00	if r2 == 0 goto +1 <LBB0_7>

0000000000000110 <LBB0_6>:
      34:	b7 07 00 00 28 00 00 00	r7 = 40

0000000000000118 <LBB0_7>:
      35:	b7 01 00 00 0a 00 00 00	r1 = 10
      36:	6b 1a ec ff 00 00 00 00	*(u16 *)(r10 - 20) = r1
      37:	b7 01 00 00 67 20 25 64	r1 = 1680154727
      38:	63 1a e8 ff 00 00 00 00	*(u32 *)(r10 - 24) = r1
      39:	18 01 00 00 52 65 74 75 00 00 00 00 72 6e 69 6e	r1 = 7956011654602581330 ll
      41:	7b 1a e0 ff 00 00 00 00	*(u64 *)(r10 - 32) = r1
      42:	bf a1 00 00 00 00 00 00	r1 = r10
      43:	07 01 00 00 e0 ff ff ff	r1 += -32
      44:	b7 02 00 00 0e 00 00 00	r2 = 14
      45:	bf 73 00 00 00 00 00 00	r3 = r7
      46:	85 00 00 00 06 00 00 00	call 6

0000000000000178 <LBB0_8>:
      47:	63 76 04 00 00 00 00 00	*(u32 *)(r6 + 4) = r7
      48:	b7 00 00 00 01 00 00 00	r0 = 1
      49:	95 00 00 00 00 00 00 00	exit
