
./ebpf-samples/all/xdp_redirect_cpu_kern.o:	file format elf64-bpf

Disassembly of section xdp_cpu_map0:

0000000000000000 <xdp_prognum0_no_touch>:
       0:	b7 06 00 00 00 00 00 00	r6 = 0
       1:	63 6a fc ff 00 00 00 00	*(u32 *)(r10 - 4) = r6
       2:	bf a2 00 00 00 00 00 00	r2 = r10
       3:	07 02 00 00 fc ff ff ff	r2 += -4
       4:	18 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00	r1 = 0 ll
       6:	85 00 00 00 01 00 00 00	call 1
       7:	15 00 16 00 00 00 00 00	if r0 == 0 goto +22 <LBB0_5>
       8:	61 07 00 00 00 00 00 00	r7 = *(u32 *)(r0 + 0)
       9:	bf a2 00 00 00 00 00 00	r2 = r10
      10:	07 02 00 00 fc ff ff ff	r2 += -4
      11:	18 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00	r1 = 0 ll
      13:	85 00 00 00 01 00 00 00	call 1
      14:	15 00 0f 00 00 00 00 00	if r0 == 0 goto +15 <LBB0_5>
      15:	79 01 00 00 00 00 00 00	r1 = *(u64 *)(r0 + 0)
      16:	07 01 00 00 01 00 00 00	r1 += 1
      17:	7b 10 00 00 00 00 00 00	*(u64 *)(r0 + 0) = r1
      18:	b7 01 00 00 40 00 00 00	r1 = 64
      19:	2d 71 04 00 00 00 00 00	if r1 > r7 goto +4 <LBB0_4>
      20:	79 01 10 00 00 00 00 00	r1 = *(u64 *)(r0 + 16)
      21:	07 01 00 00 01 00 00 00	r1 += 1
      22:	7b 10 10 00 00 00 00 00	*(u64 *)(r0 + 16) = r1
      23:	05 00 06 00 00 00 00 00	goto +6 <LBB0_5>

00000000000000c0 <LBB0_4>:
      24:	18 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00	r1 = 0 ll
      26:	bf 72 00 00 00 00 00 00	r2 = r7
      27:	b7 03 00 00 00 00 00 00	r3 = 0
      28:	85 00 00 00 33 00 00 00	call 51
      29:	bf 06 00 00 00 00 00 00	r6 = r0

00000000000000f0 <LBB0_5>:
      30:	bf 60 00 00 00 00 00 00	r0 = r6
      31:	95 00 00 00 00 00 00 00	exit

Disassembly of section xdp_cpu_map1_touch_data:

0000000000000000 <xdp_prognum1_touch_data>:
       0:	61 18 00 00 00 00 00 00	r8 = *(u32 *)(r1 + 0)
       1:	61 17 04 00 00 00 00 00	r7 = *(u32 *)(r1 + 4)
       2:	b7 06 00 00 00 00 00 00	r6 = 0
       3:	63 6a fc ff 00 00 00 00	*(u32 *)(r10 - 4) = r6
       4:	bf a2 00 00 00 00 00 00	r2 = r10
       5:	07 02 00 00 fc ff ff ff	r2 += -4
       6:	18 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00	r1 = 0 ll
       8:	85 00 00 00 01 00 00 00	call 1
       9:	15 00 20 00 00 00 00 00	if r0 == 0 goto +32 <LBB1_8>
      10:	bf 81 00 00 00 00 00 00	r1 = r8
      11:	07 01 00 00 0e 00 00 00	r1 += 14
      12:	2d 71 1d 00 00 00 00 00	if r1 > r7 goto +29 <LBB1_8>
      13:	61 07 00 00 00 00 00 00	r7 = *(u32 *)(r0 + 0)
      14:	bf a2 00 00 00 00 00 00	r2 = r10
      15:	07 02 00 00 fc ff ff ff	r2 += -4
      16:	18 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00	r1 = 0 ll
      18:	85 00 00 00 01 00 00 00	call 1
      19:	15 00 16 00 00 00 00 00	if r0 == 0 goto +22 <LBB1_8>
      20:	79 01 00 00 00 00 00 00	r1 = *(u64 *)(r0 + 0)
      21:	07 01 00 00 01 00 00 00	r1 += 1
      22:	7b 10 00 00 00 00 00 00	*(u64 *)(r0 + 0) = r1
      23:	71 81 0c 00 00 00 00 00	r1 = *(u8 *)(r8 + 12)
      24:	25 01 05 00 05 00 00 00	if r1 > 5 goto +5 <LBB1_5>
      25:	79 01 08 00 00 00 00 00	r1 = *(u64 *)(r0 + 8)
      26:	07 01 00 00 01 00 00 00	r1 += 1
      27:	7b 10 08 00 00 00 00 00	*(u64 *)(r0 + 8) = r1
      28:	b7 06 00 00 01 00 00 00	r6 = 1
      29:	05 00 0c 00 00 00 00 00	goto +12 <LBB1_8>

00000000000000f0 <LBB1_5>:
      30:	b7 01 00 00 40 00 00 00	r1 = 64
      31:	2d 71 04 00 00 00 00 00	if r1 > r7 goto +4 <LBB1_7>
      32:	79 01 10 00 00 00 00 00	r1 = *(u64 *)(r0 + 16)
      33:	07 01 00 00 01 00 00 00	r1 += 1
      34:	7b 10 10 00 00 00 00 00	*(u64 *)(r0 + 16) = r1
      35:	05 00 06 00 00 00 00 00	goto +6 <LBB1_8>

0000000000000120 <LBB1_7>:
      36:	18 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00	r1 = 0 ll
      38:	bf 72 00 00 00 00 00 00	r2 = r7
      39:	b7 03 00 00 00 00 00 00	r3 = 0
      40:	85 00 00 00 33 00 00 00	call 51
      41:	bf 06 00 00 00 00 00 00	r6 = r0

0000000000000150 <LBB1_8>:
      42:	bf 60 00 00 00 00 00 00	r0 = r6
      43:	95 00 00 00 00 00 00 00	exit

Disassembly of section xdp_cpu_map2_round_robin:

0000000000000000 <xdp_prognum2_round_robin>:
       0:	b7 06 00 00 00 00 00 00	r6 = 0
       1:	63 6a fc ff 00 00 00 00	*(u32 *)(r10 - 4) = r6
       2:	bf a2 00 00 00 00 00 00	r2 = r10
       3:	07 02 00 00 fc ff ff ff	r2 += -4
       4:	18 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00	r1 = 0 ll
       6:	85 00 00 00 01 00 00 00	call 1
       7:	bf 07 00 00 00 00 00 00	r7 = r0
       8:	15 07 30 00 00 00 00 00	if r7 == 0 goto +48 <LBB2_9>
       9:	bf a2 00 00 00 00 00 00	r2 = r10
      10:	07 02 00 00 fc ff ff ff	r2 += -4
      11:	18 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00	r1 = 0 ll
      13:	85 00 00 00 01 00 00 00	call 1
      14:	15 00 2a 00 00 00 00 00	if r0 == 0 goto +42 <LBB2_9>
      15:	61 01 00 00 00 00 00 00	r1 = *(u32 *)(r0 + 0)
      16:	63 1a f8 ff 00 00 00 00	*(u32 *)(r10 - 8) = r1
      17:	61 01 00 00 00 00 00 00	r1 = *(u32 *)(r0 + 0)
      18:	07 01 00 00 01 00 00 00	r1 += 1
      19:	63 10 00 00 00 00 00 00	*(u32 *)(r0 + 0) = r1
      20:	61 73 00 00 00 00 00 00	r3 = *(u32 *)(r7 + 0)
      21:	bf 14 00 00 00 00 00 00	r4 = r1
      22:	67 04 00 00 20 00 00 00	r4 <<= 32
      23:	77 04 00 00 20 00 00 00	r4 >>= 32
      24:	b7 06 00 00 00 00 00 00	r6 = 0
      25:	b7 02 00 00 00 00 00 00	r2 = 0
      26:	1d 34 01 00 00 00 00 00	if r4 == r3 goto +1 <LBB2_4>
      27:	bf 12 00 00 00 00 00 00	r2 = r1

00000000000000e0 <LBB2_4>:
      28:	63 20 00 00 00 00 00 00	*(u32 *)(r0 + 0) = r2
      29:	bf a2 00 00 00 00 00 00	r2 = r10
      30:	07 02 00 00 f8 ff ff ff	r2 += -8
      31:	18 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00	r1 = 0 ll
      33:	85 00 00 00 01 00 00 00	call 1
      34:	15 00 16 00 00 00 00 00	if r0 == 0 goto +22 <LBB2_9>
      35:	61 07 00 00 00 00 00 00	r7 = *(u32 *)(r0 + 0)
      36:	bf a2 00 00 00 00 00 00	r2 = r10
      37:	07 02 00 00 fc ff ff ff	r2 += -4
      38:	18 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00	r1 = 0 ll
      40:	85 00 00 00 01 00 00 00	call 1
      41:	15 00 0f 00 00 00 00 00	if r0 == 0 goto +15 <LBB2_9>
      42:	79 01 00 00 00 00 00 00	r1 = *(u64 *)(r0 + 0)
      43:	07 01 00 00 01 00 00 00	r1 += 1
      44:	7b 10 00 00 00 00 00 00	*(u64 *)(r0 + 0) = r1
      45:	b7 01 00 00 40 00 00 00	r1 = 64
      46:	2d 71 04 00 00 00 00 00	if r1 > r7 goto +4 <LBB2_8>
      47:	79 01 10 00 00 00 00 00	r1 = *(u64 *)(r0 + 16)
      48:	07 01 00 00 01 00 00 00	r1 += 1
      49:	7b 10 10 00 00 00 00 00	*(u64 *)(r0 + 16) = r1
      50:	05 00 06 00 00 00 00 00	goto +6 <LBB2_9>

0000000000000198 <LBB2_8>:
      51:	18 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00	r1 = 0 ll
      53:	bf 72 00 00 00 00 00 00	r2 = r7
      54:	b7 03 00 00 00 00 00 00	r3 = 0
      55:	85 00 00 00 33 00 00 00	call 51
      56:	bf 06 00 00 00 00 00 00	r6 = r0

00000000000001c8 <LBB2_9>:
      57:	bf 60 00 00 00 00 00 00	r0 = r6
      58:	95 00 00 00 00 00 00 00	exit

Disassembly of section xdp_cpu_map3_proto_separate:

0000000000000000 <xdp_prognum3_proto_separate>:
       0:	bf 17 00 00 00 00 00 00	r7 = r1
       1:	61 78 00 00 00 00 00 00	r8 = *(u32 *)(r7 + 0)
       2:	61 79 04 00 00 00 00 00	r9 = *(u32 *)(r7 + 4)
       3:	b7 01 00 00 00 00 00 00	r1 = 0
       4:	63 1a fc ff 00 00 00 00	*(u32 *)(r10 - 4) = r1
       5:	63 1a f8 ff 00 00 00 00	*(u32 *)(r10 - 8) = r1
       6:	bf a2 00 00 00 00 00 00	r2 = r10
       7:	07 02 00 00 f8 ff ff ff	r2 += -8
       8:	18 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00	r1 = 0 ll
      10:	85 00 00 00 01 00 00 00	call 1
      11:	bf 06 00 00 00 00 00 00	r6 = r0
      12:	b7 00 00 00 00 00 00 00	r0 = 0
      13:	15 06 59 00 00 00 00 00	if r6 == 0 goto +89 <LBB3_31>
      14:	79 61 00 00 00 00 00 00	r1 = *(u64 *)(r6 + 0)
      15:	07 01 00 00 01 00 00 00	r1 += 1
      16:	7b 16 00 00 00 00 00 00	*(u64 *)(r6 + 0) = r1
      17:	b7 00 00 00 02 00 00 00	r0 = 2
      18:	bf 81 00 00 00 00 00 00	r1 = r8
      19:	07 01 00 00 0e 00 00 00	r1 += 14
      20:	2d 91 52 00 00 00 00 00	if r1 > r9 goto +82 <LBB3_31>
      21:	71 81 0c 00 00 00 00 00	r1 = *(u8 *)(r8 + 12)
      22:	71 82 0d 00 00 00 00 00	r2 = *(u8 *)(r8 + 13)
      23:	67 02 00 00 08 00 00 00	r2 <<= 8
      24:	4f 12 00 00 00 00 00 00	r2 |= r1
      25:	bf 21 00 00 00 00 00 00	r1 = r2
      26:	57 01 00 00 ff 00 00 00	r1 &= 255
      27:	b7 03 00 00 06 00 00 00	r3 = 6
      28:	2d 13 4a 00 00 00 00 00	if r3 > r1 goto +74 <LBB3_31>
      29:	15 02 02 00 88 a8 00 00	if r2 == 43144 goto +2 <LBB3_5>
      30:	b7 01 00 00 0e 00 00 00	r1 = 14
      31:	55 02 05 00 81 00 00 00	if r2 != 129 goto +5 <LBB3_7>

0000000000000100 <LBB3_5>:
      32:	bf 81 00 00 00 00 00 00	r1 = r8
      33:	07 01 00 00 12 00 00 00	r1 += 18
      34:	2d 91 44 00 00 00 00 00	if r1 > r9 goto +68 <LBB3_31>
      35:	b7 01 00 00 12 00 00 00	r1 = 18
      36:	69 82 10 00 00 00 00 00	r2 = *(u16 *)(r8 + 16)

0000000000000128 <LBB3_7>:
      37:	bf 23 00 00 00 00 00 00	r3 = r2
      38:	57 03 00 00 ff ff 00 00	r3 &= 65535
      39:	15 03 01 00 88 a8 00 00	if r3 == 43144 goto +1 <LBB3_9>
      40:	55 03 08 00 81 00 00 00	if r3 != 129 goto +8 <LBB3_11>

0000000000000148 <LBB3_9>:
      41:	bf 13 00 00 00 00 00 00	r3 = r1
      42:	07 03 00 00 04 00 00 00	r3 += 4
      43:	bf 82 00 00 00 00 00 00	r2 = r8
      44:	0f 32 00 00 00 00 00 00	r2 += r3
      45:	2d 92 39 00 00 00 00 00	if r2 > r9 goto +57 <LBB3_31>
      46:	0f 18 00 00 00 00 00 00	r8 += r1
      47:	69 82 02 00 00 00 00 00	r2 = *(u16 *)(r8 + 2)
      48:	bf 31 00 00 00 00 00 00	r1 = r3

0000000000000188 <LBB3_11>:
      49:	dc 02 00 00 10 00 00 00	r2 = be16 r2
      50:	15 02 0e 00 dd 86 00 00	if r2 == 34525 goto +14 <LBB3_16>
      51:	15 02 09 00 06 08 00 00	if r2 == 2054 goto +9 <LBB3_24>
      52:	55 02 08 00 00 08 00 00	if r2 != 2048 goto +8 <LBB3_24>
      53:	61 72 00 00 00 00 00 00	r2 = *(u32 *)(r7 + 0)
      54:	0f 12 00 00 00 00 00 00	r2 += r1
      55:	bf 21 00 00 00 00 00 00	r1 = r2
      56:	07 01 00 00 14 00 00 00	r1 += 20
      57:	61 73 04 00 00 00 00 00	r3 = *(u32 *)(r7 + 4)
      58:	2d 31 16 00 00 00 00 00	if r1 > r3 goto +22 <LBB3_26>
      59:	07 02 00 00 09 00 00 00	r2 += 9
      60:	05 00 0b 00 00 00 00 00	goto +11 <LBB3_18>

00000000000001e8 <LBB3_24>:
      61:	b7 01 00 00 00 00 00 00	r1 = 0
      62:	63 1a fc ff 00 00 00 00	*(u32 *)(r10 - 4) = r1

00000000000001f8 <LBB3_25>:
      63:	b7 01 00 00 01 00 00 00	r1 = 1
      64:	05 00 11 00 00 00 00 00	goto +17 <LBB3_27>

0000000000000208 <LBB3_16>:
      65:	61 72 00 00 00 00 00 00	r2 = *(u32 *)(r7 + 0)
      66:	0f 12 00 00 00 00 00 00	r2 += r1
      67:	bf 21 00 00 00 00 00 00	r1 = r2
      68:	07 01 00 00 28 00 00 00	r1 += 40
      69:	61 73 04 00 00 00 00 00	r3 = *(u32 *)(r7 + 4)
      70:	2d 31 0a 00 00 00 00 00	if r1 > r3 goto +10 <LBB3_26>
      71:	07 02 00 00 06 00 00 00	r2 += 6

0000000000000240 <LBB3_18>:
      72:	71 21 00 00 00 00 00 00	r1 = *(u8 *)(r2 + 0)
      73:	65 01 03 00 10 00 00 00	if r1 s> 16 goto +3 <LBB3_21>
      74:	15 01 04 00 01 00 00 00	if r1 == 1 goto +4 <LBB3_23>
      75:	15 01 05 00 06 00 00 00	if r1 == 6 goto +5 <LBB3_26>
      76:	05 00 04 00 00 00 00 00	goto +4 <LBB3_26>

0000000000000268 <LBB3_21>:
      77:	15 01 f1 ff 11 00 00 00	if r1 == 17 goto -15 <LBB3_25>
      78:	55 01 02 00 3a 00 00 00	if r1 != 58 goto +2 <LBB3_26>

0000000000000278 <LBB3_23>:
      79:	b7 01 00 00 02 00 00 00	r1 = 2
      80:	05 00 01 00 00 00 00 00	goto +1 <LBB3_27>

0000000000000288 <LBB3_26>:
      81:	b7 01 00 00 00 00 00 00	r1 = 0

0000000000000290 <LBB3_27>:
      82:	63 1a fc ff 00 00 00 00	*(u32 *)(r10 - 4) = r1
      83:	bf a2 00 00 00 00 00 00	r2 = r10
      84:	07 02 00 00 fc ff ff ff	r2 += -4
      85:	18 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00	r1 = 0 ll
      87:	85 00 00 00 01 00 00 00	call 1
      88:	bf 01 00 00 00 00 00 00	r1 = r0
      89:	b7 00 00 00 00 00 00 00	r0 = 0
      90:	15 01 0c 00 00 00 00 00	if r1 == 0 goto +12 <LBB3_31>
      91:	61 12 00 00 00 00 00 00	r2 = *(u32 *)(r1 + 0)
      92:	b7 01 00 00 40 00 00 00	r1 = 64
      93:	2d 21 05 00 00 00 00 00	if r1 > r2 goto +5 <LBB3_30>
      94:	79 61 10 00 00 00 00 00	r1 = *(u64 *)(r6 + 16)
      95:	07 01 00 00 01 00 00 00	r1 += 1
      96:	7b 16 10 00 00 00 00 00	*(u64 *)(r6 + 16) = r1
      97:	b7 00 00 00 00 00 00 00	r0 = 0
      98:	05 00 04 00 00 00 00 00	goto +4 <LBB3_31>

0000000000000318 <LBB3_30>:
      99:	18 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00	r1 = 0 ll
     101:	b7 03 00 00 00 00 00 00	r3 = 0
     102:	85 00 00 00 33 00 00 00	call 51

0000000000000338 <LBB3_31>:
     103:	95 00 00 00 00 00 00 00	exit

Disassembly of section xdp_cpu_map4_ddos_filter_pktgen:

0000000000000000 <xdp_prognum4_ddos_filter_pktgen>:
       0:	bf 17 00 00 00 00 00 00	r7 = r1
       1:	61 78 00 00 00 00 00 00	r8 = *(u32 *)(r7 + 0)
       2:	61 79 04 00 00 00 00 00	r9 = *(u32 *)(r7 + 4)
       3:	b7 01 00 00 00 00 00 00	r1 = 0
       4:	63 1a fc ff 00 00 00 00	*(u32 *)(r10 - 4) = r1
       5:	63 1a f8 ff 00 00 00 00	*(u32 *)(r10 - 8) = r1
       6:	bf a2 00 00 00 00 00 00	r2 = r10
       7:	07 02 00 00 f8 ff ff ff	r2 += -8
       8:	18 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00	r1 = 0 ll
      10:	85 00 00 00 01 00 00 00	call 1
      11:	bf 06 00 00 00 00 00 00	r6 = r0
      12:	b7 00 00 00 00 00 00 00	r0 = 0
      13:	15 06 6b 00 00 00 00 00	if r6 == 0 goto +107 <LBB4_36>
      14:	79 61 00 00 00 00 00 00	r1 = *(u64 *)(r6 + 0)
      15:	07 01 00 00 01 00 00 00	r1 += 1
      16:	7b 16 00 00 00 00 00 00	*(u64 *)(r6 + 0) = r1
      17:	b7 00 00 00 02 00 00 00	r0 = 2
      18:	bf 81 00 00 00 00 00 00	r1 = r8
      19:	07 01 00 00 0e 00 00 00	r1 += 14
      20:	2d 91 64 00 00 00 00 00	if r1 > r9 goto +100 <LBB4_36>
      21:	71 81 0c 00 00 00 00 00	r1 = *(u8 *)(r8 + 12)
      22:	71 82 0d 00 00 00 00 00	r2 = *(u8 *)(r8 + 13)
      23:	67 02 00 00 08 00 00 00	r2 <<= 8
      24:	4f 12 00 00 00 00 00 00	r2 |= r1
      25:	bf 21 00 00 00 00 00 00	r1 = r2
      26:	57 01 00 00 ff 00 00 00	r1 &= 255
      27:	b7 03 00 00 06 00 00 00	r3 = 6
      28:	2d 13 5c 00 00 00 00 00	if r3 > r1 goto +92 <LBB4_36>
      29:	15 02 02 00 88 a8 00 00	if r2 == 43144 goto +2 <LBB4_5>
      30:	b7 01 00 00 0e 00 00 00	r1 = 14
      31:	55 02 05 00 81 00 00 00	if r2 != 129 goto +5 <LBB4_7>

0000000000000100 <LBB4_5>:
      32:	bf 81 00 00 00 00 00 00	r1 = r8
      33:	07 01 00 00 12 00 00 00	r1 += 18
      34:	2d 91 56 00 00 00 00 00	if r1 > r9 goto +86 <LBB4_36>
      35:	b7 01 00 00 12 00 00 00	r1 = 18
      36:	69 82 10 00 00 00 00 00	r2 = *(u16 *)(r8 + 16)

0000000000000128 <LBB4_7>:
      37:	bf 23 00 00 00 00 00 00	r3 = r2
      38:	57 03 00 00 ff ff 00 00	r3 &= 65535
      39:	15 03 01 00 88 a8 00 00	if r3 == 43144 goto +1 <LBB4_9>
      40:	55 03 08 00 81 00 00 00	if r3 != 129 goto +8 <LBB4_11>

0000000000000148 <LBB4_9>:
      41:	bf 13 00 00 00 00 00 00	r3 = r1
      42:	07 03 00 00 04 00 00 00	r3 += 4
      43:	bf 82 00 00 00 00 00 00	r2 = r8
      44:	0f 32 00 00 00 00 00 00	r2 += r3
      45:	2d 92 4b 00 00 00 00 00	if r2 > r9 goto +75 <LBB4_36>
      46:	0f 18 00 00 00 00 00 00	r8 += r1
      47:	69 82 02 00 00 00 00 00	r2 = *(u16 *)(r8 + 2)
      48:	bf 31 00 00 00 00 00 00	r1 = r3

0000000000000188 <LBB4_11>:
      49:	dc 02 00 00 10 00 00 00	r2 = be16 r2
      50:	15 02 20 00 dd 86 00 00	if r2 == 34525 goto +32 <LBB4_16>
      51:	15 02 09 00 06 08 00 00	if r2 == 2054 goto +9 <LBB4_24>
      52:	55 02 08 00 00 08 00 00	if r2 != 2048 goto +8 <LBB4_24>
      53:	61 72 00 00 00 00 00 00	r2 = *(u32 *)(r7 + 0)
      54:	0f 12 00 00 00 00 00 00	r2 += r1
      55:	bf 23 00 00 00 00 00 00	r3 = r2
      56:	07 03 00 00 14 00 00 00	r3 += 20
      57:	61 74 04 00 00 00 00 00	r4 = *(u32 *)(r7 + 4)
      58:	2d 43 28 00 00 00 00 00	if r3 > r4 goto +40 <LBB4_30>
      59:	07 02 00 00 09 00 00 00	r2 += 9
      60:	05 00 1d 00 00 00 00 00	goto +29 <LBB4_18>

00000000000001e8 <LBB4_24>:
      61:	b7 02 00 00 00 00 00 00	r2 = 0
      62:	63 2a fc ff 00 00 00 00	*(u32 *)(r10 - 4) = r2

00000000000001f8 <LBB4_25>:
      63:	b7 02 00 00 01 00 00 00	r2 = 1
      64:	63 2a fc ff 00 00 00 00	*(u32 *)(r10 - 4) = r2
      65:	61 73 00 00 00 00 00 00	r3 = *(u32 *)(r7 + 0)
      66:	0f 13 00 00 00 00 00 00	r3 += r1
      67:	bf 31 00 00 00 00 00 00	r1 = r3
      68:	07 01 00 00 14 00 00 00	r1 += 20
      69:	61 72 04 00 00 00 00 00	r2 = *(u32 *)(r7 + 4)
      70:	2d 21 1e 00 00 00 00 00	if r1 > r2 goto +30 <LBB4_32>
      71:	71 33 09 00 00 00 00 00	r3 = *(u8 *)(r3 + 9)
      72:	55 03 1c 00 11 00 00 00	if r3 != 17 goto +28 <LBB4_32>
      73:	bf 13 00 00 00 00 00 00	r3 = r1
      74:	07 03 00 00 08 00 00 00	r3 += 8
      75:	2d 23 19 00 00 00 00 00	if r3 > r2 goto +25 <LBB4_32>
      76:	69 11 02 00 00 00 00 00	r1 = *(u16 *)(r1 + 2)
      77:	55 01 17 00 00 09 00 00	if r1 != 2304 goto +23 <LBB4_32>
      78:	79 61 08 00 00 00 00 00	r1 = *(u64 *)(r6 + 8)
      79:	07 01 00 00 01 00 00 00	r1 += 1
      80:	7b 16 08 00 00 00 00 00	*(u64 *)(r6 + 8) = r1
      81:	b7 00 00 00 01 00 00 00	r0 = 1
      82:	05 00 26 00 00 00 00 00	goto +38 <LBB4_36>

0000000000000298 <LBB4_16>:
      83:	61 72 00 00 00 00 00 00	r2 = *(u32 *)(r7 + 0)
      84:	0f 12 00 00 00 00 00 00	r2 += r1
      85:	bf 23 00 00 00 00 00 00	r3 = r2
      86:	07 03 00 00 28 00 00 00	r3 += 40
      87:	61 74 04 00 00 00 00 00	r4 = *(u32 *)(r7 + 4)
      88:	2d 43 0a 00 00 00 00 00	if r3 > r4 goto +10 <LBB4_30>
      89:	07 02 00 00 06 00 00 00	r2 += 6

00000000000002d0 <LBB4_18>:
      90:	71 22 00 00 00 00 00 00	r2 = *(u8 *)(r2 + 0)
      91:	65 02 03 00 10 00 00 00	if r2 s> 16 goto +3 <LBB4_21>
      92:	15 02 04 00 01 00 00 00	if r2 == 1 goto +4 <LBB4_23>
      93:	15 02 05 00 06 00 00 00	if r2 == 6 goto +5 <LBB4_30>
      94:	05 00 04 00 00 00 00 00	goto +4 <LBB4_30>

00000000000002f8 <LBB4_21>:
      95:	15 02 df ff 11 00 00 00	if r2 == 17 goto -33 <LBB4_25>
      96:	55 02 02 00 3a 00 00 00	if r2 != 58 goto +2 <LBB4_30>

0000000000000308 <LBB4_23>:
      97:	b7 01 00 00 02 00 00 00	r1 = 2
      98:	05 00 01 00 00 00 00 00	goto +1 <LBB4_31>

0000000000000318 <LBB4_30>:
      99:	b7 01 00 00 00 00 00 00	r1 = 0

0000000000000320 <LBB4_31>:
     100:	63 1a fc ff 00 00 00 00	*(u32 *)(r10 - 4) = r1

0000000000000328 <LBB4_32>:
     101:	bf a2 00 00 00 00 00 00	r2 = r10
     102:	07 02 00 00 fc ff ff ff	r2 += -4
     103:	18 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00	r1 = 0 ll
     105:	85 00 00 00 01 00 00 00	call 1
     106:	bf 01 00 00 00 00 00 00	r1 = r0
     107:	b7 00 00 00 00 00 00 00	r0 = 0
     108:	15 01 0c 00 00 00 00 00	if r1 == 0 goto +12 <LBB4_36>
     109:	61 12 00 00 00 00 00 00	r2 = *(u32 *)(r1 + 0)
     110:	b7 01 00 00 40 00 00 00	r1 = 64
     111:	2d 21 05 00 00 00 00 00	if r1 > r2 goto +5 <LBB4_35>
     112:	79 61 10 00 00 00 00 00	r1 = *(u64 *)(r6 + 16)
     113:	07 01 00 00 01 00 00 00	r1 += 1
     114:	7b 16 10 00 00 00 00 00	*(u64 *)(r6 + 16) = r1
     115:	b7 00 00 00 00 00 00 00	r0 = 0
     116:	05 00 04 00 00 00 00 00	goto +4 <LBB4_36>

00000000000003a8 <LBB4_35>:
     117:	18 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00	r1 = 0 ll
     119:	b7 03 00 00 00 00 00 00	r3 = 0
     120:	85 00 00 00 33 00 00 00	call 51

00000000000003c8 <LBB4_36>:
     121:	95 00 00 00 00 00 00 00	exit

Disassembly of section xdp_cpu_map5_lb_hash_ip_pairs:

0000000000000000 <xdp_prognum5_lb_hash_ip_pairs>:
       0:	bf 17 00 00 00 00 00 00	r7 = r1
       1:	61 79 00 00 00 00 00 00	r9 = *(u32 *)(r7 + 0)
       2:	61 76 04 00 00 00 00 00	r6 = *(u32 *)(r7 + 4)
       3:	b7 08 00 00 00 00 00 00	r8 = 0
       4:	63 8a fc ff 00 00 00 00	*(u32 *)(r10 - 4) = r8
       5:	63 8a f8 ff 00 00 00 00	*(u32 *)(r10 - 8) = r8
       6:	bf a2 00 00 00 00 00 00	r2 = r10
       7:	07 02 00 00 f8 ff ff ff	r2 += -8
       8:	18 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00	r1 = 0 ll
      10:	85 00 00 00 01 00 00 00	call 1
      11:	15 00 a0 00 00 00 00 00	if r0 == 0 goto +160 <LBB5_23>
      12:	79 01 00 00 00 00 00 00	r1 = *(u64 *)(r0 + 0)
      13:	07 01 00 00 01 00 00 00	r1 += 1
      14:	7b 10 00 00 00 00 00 00	*(u64 *)(r0 + 0) = r1
      15:	bf a2 00 00 00 00 00 00	r2 = r10
      16:	07 02 00 00 f8 ff ff ff	r2 += -8
      17:	18 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00	r1 = 0 ll
      19:	7b 0a f0 ff 00 00 00 00	*(u64 *)(r10 - 16) = r0
      20:	85 00 00 00 01 00 00 00	call 1
      21:	15 00 96 00 00 00 00 00	if r0 == 0 goto +150 <LBB5_23>
      22:	b7 08 00 00 02 00 00 00	r8 = 2
      23:	bf 91 00 00 00 00 00 00	r1 = r9
      24:	07 01 00 00 0e 00 00 00	r1 += 14
      25:	2d 61 92 00 00 00 00 00	if r1 > r6 goto +146 <LBB5_23>
      26:	71 91 0c 00 00 00 00 00	r1 = *(u8 *)(r9 + 12)
      27:	71 93 0d 00 00 00 00 00	r3 = *(u8 *)(r9 + 13)
      28:	67 03 00 00 08 00 00 00	r3 <<= 8
      29:	4f 13 00 00 00 00 00 00	r3 |= r1
      30:	bf 31 00 00 00 00 00 00	r1 = r3
      31:	57 01 00 00 ff 00 00 00	r1 &= 255
      32:	b7 02 00 00 06 00 00 00	r2 = 6
      33:	2d 12 8a 00 00 00 00 00	if r2 > r1 goto +138 <LBB5_23>
      34:	15 03 02 00 88 a8 00 00	if r3 == 43144 goto +2 <LBB5_6>
      35:	b7 02 00 00 0e 00 00 00	r2 = 14
      36:	55 03 05 00 81 00 00 00	if r3 != 129 goto +5 <LBB5_8>

0000000000000128 <LBB5_6>:
      37:	bf 91 00 00 00 00 00 00	r1 = r9
      38:	07 01 00 00 12 00 00 00	r1 += 18
      39:	2d 61 84 00 00 00 00 00	if r1 > r6 goto +132 <LBB5_23>
      40:	b7 02 00 00 12 00 00 00	r2 = 18
      41:	69 93 10 00 00 00 00 00	r3 = *(u16 *)(r9 + 16)

0000000000000150 <LBB5_8>:
      42:	bf 31 00 00 00 00 00 00	r1 = r3
      43:	57 01 00 00 ff ff 00 00	r1 &= 65535
      44:	15 01 01 00 88 a8 00 00	if r1 == 43144 goto +1 <LBB5_10>
      45:	55 01 08 00 81 00 00 00	if r1 != 129 goto +8 <LBB5_12>

0000000000000170 <LBB5_10>:
      46:	bf 21 00 00 00 00 00 00	r1 = r2
      47:	07 01 00 00 04 00 00 00	r1 += 4
      48:	bf 93 00 00 00 00 00 00	r3 = r9
      49:	0f 13 00 00 00 00 00 00	r3 += r1
      50:	2d 63 79 00 00 00 00 00	if r3 > r6 goto +121 <LBB5_23>
      51:	0f 29 00 00 00 00 00 00	r9 += r2
      52:	69 93 02 00 00 00 00 00	r3 = *(u16 *)(r9 + 2)
      53:	bf 12 00 00 00 00 00 00	r2 = r1

00000000000001b0 <LBB5_12>:
      54:	b7 01 00 00 00 00 00 00	r1 = 0
      55:	dc 03 00 00 10 00 00 00	r3 = be16 r3
      56:	15 03 16 00 dd 86 00 00	if r3 == 34525 goto +22 <LBB5_16>
      57:	55 03 56 00 00 08 00 00	if r3 != 2048 goto +86 <LBB5_19>
      58:	61 73 00 00 00 00 00 00	r3 = *(u32 *)(r7 + 0)
      59:	0f 23 00 00 00 00 00 00	r3 += r2
      60:	bf 32 00 00 00 00 00 00	r2 = r3
      61:	07 02 00 00 14 00 00 00	r2 += 20
      62:	61 74 04 00 00 00 00 00	r4 = *(u32 *)(r7 + 4)
      63:	2d 42 50 00 00 00 00 00	if r2 > r4 goto +80 <LBB5_19>
      64:	61 31 0c 00 00 00 00 00	r1 = *(u32 *)(r3 + 12)
      65:	61 32 10 00 00 00 00 00	r2 = *(u32 *)(r3 + 16)
      66:	0f 12 00 00 00 00 00 00	r2 += r1
      67:	71 31 09 00 00 00 00 00	r1 = *(u8 *)(r3 + 9)
      68:	bf 23 00 00 00 00 00 00	r3 = r2
      69:	57 03 00 00 ff ff 00 00	r3 &= 65535
      70:	0f 31 00 00 00 00 00 00	r1 += r3
      71:	77 02 00 00 05 00 00 00	r2 >>= 5
      72:	57 02 00 00 00 f8 ff 07	r2 &= 134215680
      73:	07 01 00 00 a7 4b ec 00	r1 += 15485863
      74:	bf 13 00 00 00 00 00 00	r3 = r1
      75:	af 23 00 00 00 00 00 00	r3 ^= r2
      76:	67 01 00 00 10 00 00 00	r1 <<= 16
      77:	af 13 00 00 00 00 00 00	r3 ^= r1
      78:	05 00 20 00 00 00 00 00	goto +32 <LBB5_18>

0000000000000278 <LBB5_16>:
      79:	61 73 00 00 00 00 00 00	r3 = *(u32 *)(r7 + 0)
      80:	0f 23 00 00 00 00 00 00	r3 += r2
      81:	bf 32 00 00 00 00 00 00	r2 = r3
      82:	07 02 00 00 28 00 00 00	r2 += 40
      83:	61 74 04 00 00 00 00 00	r4 = *(u32 *)(r7 + 4)
      84:	2d 42 3b 00 00 00 00 00	if r2 > r4 goto +59 <LBB5_19>
      85:	61 32 08 00 00 00 00 00	r2 = *(u32 *)(r3 + 8)
      86:	61 31 18 00 00 00 00 00	r1 = *(u32 *)(r3 + 24)
      87:	0f 21 00 00 00 00 00 00	r1 += r2
      88:	61 32 0c 00 00 00 00 00	r2 = *(u32 *)(r3 + 12)
      89:	0f 21 00 00 00 00 00 00	r1 += r2
      90:	61 32 1c 00 00 00 00 00	r2 = *(u32 *)(r3 + 28)
      91:	0f 21 00 00 00 00 00 00	r1 += r2
      92:	61 32 10 00 00 00 00 00	r2 = *(u32 *)(r3 + 16)
      93:	0f 21 00 00 00 00 00 00	r1 += r2
      94:	61 32 20 00 00 00 00 00	r2 = *(u32 *)(r3 + 32)
      95:	0f 21 00 00 00 00 00 00	r1 += r2
      96:	61 32 14 00 00 00 00 00	r2 = *(u32 *)(r3 + 20)
      97:	0f 21 00 00 00 00 00 00	r1 += r2
      98:	61 32 24 00 00 00 00 00	r2 = *(u32 *)(r3 + 36)
      99:	0f 21 00 00 00 00 00 00	r1 += r2
     100:	71 32 06 00 00 00 00 00	r2 = *(u8 *)(r3 + 6)
     101:	bf 13 00 00 00 00 00 00	r3 = r1
     102:	57 03 00 00 ff ff 00 00	r3 &= 65535
     103:	0f 32 00 00 00 00 00 00	r2 += r3
     104:	77 01 00 00 05 00 00 00	r1 >>= 5
     105:	57 01 00 00 00 f8 ff 07	r1 &= 134215680
     106:	07 02 00 00 a7 4b ec 00	r2 += 15485863
     107:	bf 23 00 00 00 00 00 00	r3 = r2
     108:	af 13 00 00 00 00 00 00	r3 ^= r1
     109:	67 02 00 00 10 00 00 00	r2 <<= 16
     110:	af 23 00 00 00 00 00 00	r3 ^= r2

0000000000000378 <LBB5_18>:
     111:	18 01 00 00 00 f8 ff ff 00 00 00 00 00 00 00 00	r1 = 4294965248 ll
     113:	bf 32 00 00 00 00 00 00	r2 = r3
     114:	5f 12 00 00 00 00 00 00	r2 &= r1
     115:	77 02 00 00 0b 00 00 00	r2 >>= 11
     116:	0f 32 00 00 00 00 00 00	r2 += r3
     117:	bf 21 00 00 00 00 00 00	r1 = r2
     118:	67 01 00 00 03 00 00 00	r1 <<= 3
     119:	af 21 00 00 00 00 00 00	r1 ^= r2
     120:	18 02 00 00 e0 ff ff ff 00 00 00 00 00 00 00 00	r2 = 4294967264 ll
     122:	bf 13 00 00 00 00 00 00	r3 = r1
     123:	5f 23 00 00 00 00 00 00	r3 &= r2
     124:	77 03 00 00 05 00 00 00	r3 >>= 5
     125:	0f 13 00 00 00 00 00 00	r3 += r1
     126:	bf 31 00 00 00 00 00 00	r1 = r3
     127:	67 01 00 00 04 00 00 00	r1 <<= 4
     128:	af 31 00 00 00 00 00 00	r1 ^= r3
     129:	18 02 00 00 00 00 fe ff 00 00 00 00 00 00 00 00	r2 = 4294836224 ll
     131:	bf 13 00 00 00 00 00 00	r3 = r1
     132:	5f 23 00 00 00 00 00 00	r3 &= r2
     133:	77 03 00 00 11 00 00 00	r3 >>= 17
     134:	0f 13 00 00 00 00 00 00	r3 += r1
     135:	bf 32 00 00 00 00 00 00	r2 = r3
     136:	67 02 00 00 19 00 00 00	r2 <<= 25
     137:	af 32 00 00 00 00 00 00	r2 ^= r3
     138:	18 03 00 00 c0 ff ff ff 00 00 00 00 00 00 00 00	r3 = 4294967232 ll
     140:	bf 21 00 00 00 00 00 00	r1 = r2
     141:	5f 31 00 00 00 00 00 00	r1 &= r3
     142:	77 01 00 00 06 00 00 00	r1 >>= 6
     143:	0f 21 00 00 00 00 00 00	r1 += r2

0000000000000480 <LBB5_19>:
     144:	61 02 00 00 00 00 00 00	r2 = *(u32 *)(r0 + 0)
     145:	67 01 00 00 20 00 00 00	r1 <<= 32
     146:	77 01 00 00 20 00 00 00	r1 >>= 32
     147:	bf 13 00 00 00 00 00 00	r3 = r1
     148:	3f 23 00 00 00 00 00 00	r3 /= r2
     149:	2f 23 00 00 00 00 00 00	r3 *= r2
     150:	1f 31 00 00 00 00 00 00	r1 -= r3
     151:	63 1a fc ff 00 00 00 00	*(u32 *)(r10 - 4) = r1
     152:	bf a2 00 00 00 00 00 00	r2 = r10
     153:	07 02 00 00 fc ff ff ff	r2 += -4
     154:	18 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00	r1 = 0 ll
     156:	85 00 00 00 01 00 00 00	call 1
     157:	b7 08 00 00 00 00 00 00	r8 = 0
     158:	79 a3 f0 ff 00 00 00 00	r3 = *(u64 *)(r10 - 16)
     159:	15 00 0c 00 00 00 00 00	if r0 == 0 goto +12 <LBB5_23>
     160:	61 02 00 00 00 00 00 00	r2 = *(u32 *)(r0 + 0)
     161:	b7 01 00 00 40 00 00 00	r1 = 64
     162:	2d 21 04 00 00 00 00 00	if r1 > r2 goto +4 <LBB5_22>
     163:	79 31 10 00 00 00 00 00	r1 = *(u64 *)(r3 + 16)
     164:	07 01 00 00 01 00 00 00	r1 += 1
     165:	7b 13 10 00 00 00 00 00	*(u64 *)(r3 + 16) = r1
     166:	05 00 05 00 00 00 00 00	goto +5 <LBB5_23>

0000000000000538 <LBB5_22>:
     167:	18 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00	r1 = 0 ll
     169:	b7 03 00 00 00 00 00 00	r3 = 0
     170:	85 00 00 00 33 00 00 00	call 51
     171:	bf 08 00 00 00 00 00 00	r8 = r0

0000000000000560 <LBB5_23>:
     172:	bf 80 00 00 00 00 00 00	r0 = r8
     173:	95 00 00 00 00 00 00 00	exit

Disassembly of section tracepoint/xdp/xdp_redirect_err:

0000000000000000 <trace_xdp_redirect_err>:
       0:	61 12 14 00 00 00 00 00	r2 = *(u32 *)(r1 + 20)
       1:	b7 01 00 00 01 00 00 00	r1 = 1
       2:	55 02 01 00 00 00 00 00	if r2 != 0 goto +1 <LBB6_2>
       3:	b7 01 00 00 00 00 00 00	r1 = 0

0000000000000020 <LBB6_2>:
       4:	63 1a fc ff 00 00 00 00	*(u32 *)(r10 - 4) = r1
       5:	bf a2 00 00 00 00 00 00	r2 = r10
       6:	07 02 00 00 fc ff ff ff	r2 += -4
       7:	18 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00	r1 = 0 ll
       9:	85 00 00 00 01 00 00 00	call 1
      10:	15 00 03 00 00 00 00 00	if r0 == 0 goto +3 <LBB6_4>
      11:	79 01 08 00 00 00 00 00	r1 = *(u64 *)(r0 + 8)
      12:	07 01 00 00 01 00 00 00	r1 += 1
      13:	7b 10 08 00 00 00 00 00	*(u64 *)(r0 + 8) = r1

0000000000000070 <LBB6_4>:
      14:	b7 00 00 00 00 00 00 00	r0 = 0
      15:	95 00 00 00 00 00 00 00	exit

Disassembly of section tracepoint/xdp/xdp_redirect_map_err:

0000000000000000 <trace_xdp_redirect_map_err>:
       0:	61 12 14 00 00 00 00 00	r2 = *(u32 *)(r1 + 20)
       1:	b7 01 00 00 01 00 00 00	r1 = 1
       2:	55 02 01 00 00 00 00 00	if r2 != 0 goto +1 <LBB7_2>
       3:	b7 01 00 00 00 00 00 00	r1 = 0

0000000000000020 <LBB7_2>:
       4:	63 1a fc ff 00 00 00 00	*(u32 *)(r10 - 4) = r1
       5:	bf a2 00 00 00 00 00 00	r2 = r10
       6:	07 02 00 00 fc ff ff ff	r2 += -4
       7:	18 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00	r1 = 0 ll
       9:	85 00 00 00 01 00 00 00	call 1
      10:	15 00 03 00 00 00 00 00	if r0 == 0 goto +3 <LBB7_4>
      11:	79 01 08 00 00 00 00 00	r1 = *(u64 *)(r0 + 8)
      12:	07 01 00 00 01 00 00 00	r1 += 1
      13:	7b 10 08 00 00 00 00 00	*(u64 *)(r0 + 8) = r1

0000000000000070 <LBB7_4>:
      14:	b7 00 00 00 00 00 00 00	r0 = 0
      15:	95 00 00 00 00 00 00 00	exit

Disassembly of section tracepoint/xdp/xdp_exception:

0000000000000000 <trace_xdp_exception>:
       0:	b7 01 00 00 00 00 00 00	r1 = 0
       1:	63 1a fc ff 00 00 00 00	*(u32 *)(r10 - 4) = r1
       2:	bf a2 00 00 00 00 00 00	r2 = r10
       3:	07 02 00 00 fc ff ff ff	r2 += -4
       4:	18 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00	r1 = 0 ll
       6:	85 00 00 00 01 00 00 00	call 1
       7:	b7 01 00 00 01 00 00 00	r1 = 1
       8:	15 00 04 00 00 00 00 00	if r0 == 0 goto +4 <LBB8_2>
       9:	79 01 08 00 00 00 00 00	r1 = *(u64 *)(r0 + 8)
      10:	07 01 00 00 01 00 00 00	r1 += 1
      11:	7b 10 08 00 00 00 00 00	*(u64 *)(r0 + 8) = r1
      12:	b7 01 00 00 00 00 00 00	r1 = 0

0000000000000068 <LBB8_2>:
      13:	bf 10 00 00 00 00 00 00	r0 = r1
      14:	95 00 00 00 00 00 00 00	exit

Disassembly of section tracepoint/xdp/xdp_cpumap_enqueue:

0000000000000000 <trace_xdp_cpumap_enqueue>:
       0:	bf 16 00 00 00 00 00 00	r6 = r1
       1:	b7 00 00 00 01 00 00 00	r0 = 1
       2:	61 61 1c 00 00 00 00 00	r1 = *(u32 *)(r6 + 28)
       3:	63 1a fc ff 00 00 00 00	*(u32 *)(r10 - 4) = r1
       4:	25 01 14 00 3f 00 00 00	if r1 > 63 goto +20 <LBB9_4>
       5:	bf a2 00 00 00 00 00 00	r2 = r10
       6:	07 02 00 00 fc ff ff ff	r2 += -4
       7:	18 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00	r1 = 0 ll
       9:	85 00 00 00 01 00 00 00	call 1
      10:	bf 01 00 00 00 00 00 00	r1 = r0
      11:	b7 00 00 00 00 00 00 00	r0 = 0
      12:	15 01 0c 00 00 00 00 00	if r1 == 0 goto +12 <LBB9_4>
      13:	61 62 18 00 00 00 00 00	r2 = *(u32 *)(r6 + 24)
      14:	79 13 00 00 00 00 00 00	r3 = *(u64 *)(r1 + 0)
      15:	0f 23 00 00 00 00 00 00	r3 += r2
      16:	7b 31 00 00 00 00 00 00	*(u64 *)(r1 + 0) = r3
      17:	61 63 14 00 00 00 00 00	r3 = *(u32 *)(r6 + 20)
      18:	79 14 08 00 00 00 00 00	r4 = *(u64 *)(r1 + 8)
      19:	0f 34 00 00 00 00 00 00	r4 += r3
      20:	7b 41 08 00 00 00 00 00	*(u64 *)(r1 + 8) = r4
      21:	15 02 03 00 00 00 00 00	if r2 == 0 goto +3 <LBB9_4>
      22:	79 12 10 00 00 00 00 00	r2 = *(u64 *)(r1 + 16)
      23:	07 02 00 00 01 00 00 00	r2 += 1
      24:	7b 21 10 00 00 00 00 00	*(u64 *)(r1 + 16) = r2

00000000000000c8 <LBB9_4>:
      25:	95 00 00 00 00 00 00 00	exit

Disassembly of section tracepoint/xdp/xdp_cpumap_kthread:

0000000000000000 <trace_xdp_cpumap_kthread>:
       0:	bf 16 00 00 00 00 00 00	r6 = r1
       1:	b7 01 00 00 00 00 00 00	r1 = 0
       2:	63 1a fc ff 00 00 00 00	*(u32 *)(r10 - 4) = r1
       3:	bf a2 00 00 00 00 00 00	r2 = r10
       4:	07 02 00 00 fc ff ff ff	r2 += -4
       5:	18 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00	r1 = 0 ll
       7:	85 00 00 00 01 00 00 00	call 1
       8:	15 00 0d 00 00 00 00 00	if r0 == 0 goto +13 <LBB10_3>
       9:	61 61 18 00 00 00 00 00	r1 = *(u32 *)(r6 + 24)
      10:	79 02 00 00 00 00 00 00	r2 = *(u64 *)(r0 + 0)
      11:	0f 12 00 00 00 00 00 00	r2 += r1
      12:	7b 20 00 00 00 00 00 00	*(u64 *)(r0 + 0) = r2
      13:	79 01 08 00 00 00 00 00	r1 = *(u64 *)(r0 + 8)
      14:	61 62 14 00 00 00 00 00	r2 = *(u32 *)(r6 + 20)
      15:	0f 21 00 00 00 00 00 00	r1 += r2
      16:	7b 10 08 00 00 00 00 00	*(u64 *)(r0 + 8) = r1
      17:	61 61 1c 00 00 00 00 00	r1 = *(u32 *)(r6 + 28)
      18:	15 01 03 00 00 00 00 00	if r1 == 0 goto +3 <LBB10_3>
      19:	79 01 10 00 00 00 00 00	r1 = *(u64 *)(r0 + 16)
      20:	07 01 00 00 01 00 00 00	r1 += 1
      21:	7b 10 10 00 00 00 00 00	*(u64 *)(r0 + 16) = r1

00000000000000b0 <LBB10_3>:
      22:	b7 00 00 00 00 00 00 00	r0 = 0
      23:	95 00 00 00 00 00 00 00	exit
