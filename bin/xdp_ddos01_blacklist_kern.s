
./ebpf-samples/all/xdp_ddos01_blacklist_kern.o:	file format elf64-bpf

Disassembly of section .text:

0000000000000000 <parse_port>:
       0:	61 11 04 00 00 00 00 00	r1 = *(u32 *)(r1 + 4)
       1:	15 02 08 00 06 00 00 00	if r2 == 6 goto +8 <LBB0_3>
       2:	b7 06 00 00 02 00 00 00	r6 = 2
       3:	55 02 2c 00 11 00 00 00	if r2 != 17 goto +44 <LBB0_13>
       4:	b7 07 00 00 01 00 00 00	r7 = 1
       5:	b7 06 00 00 00 00 00 00	r6 = 0
       6:	bf 32 00 00 00 00 00 00	r2 = r3
       7:	07 02 00 00 08 00 00 00	r2 += 8
       8:	2d 12 27 00 00 00 00 00	if r2 > r1 goto +39 <LBB0_13>
       9:	05 00 05 00 00 00 00 00	goto +5 <LBB0_4>

0000000000000050 <LBB0_3>:
      10:	b7 07 00 00 00 00 00 00	r7 = 0
      11:	bf 32 00 00 00 00 00 00	r2 = r3
      12:	07 02 00 00 14 00 00 00	r2 += 20
      13:	b7 06 00 00 00 00 00 00	r6 = 0
      14:	2d 12 21 00 00 00 00 00	if r2 > r1 goto +33 <LBB0_13>

0000000000000078 <LBB0_4>:
      15:	69 31 02 00 00 00 00 00	r1 = *(u16 *)(r3 + 2)
      16:	dc 01 00 00 10 00 00 00	r1 = be16 r1
      17:	63 1a fc ff 00 00 00 00	*(u32 *)(r10 - 4) = r1
      18:	bf a2 00 00 00 00 00 00	r2 = r10
      19:	07 02 00 00 fc ff ff ff	r2 += -4
      20:	18 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00	r1 = 0 ll
      22:	85 00 00 00 01 00 00 00	call 1
      23:	b7 06 00 00 02 00 00 00	r6 = 2
      24:	15 00 17 00 00 00 00 00	if r0 == 0 goto +23 <LBB0_13>
      25:	b7 01 00 00 01 00 00 00	r1 = 1
      26:	6f 71 00 00 00 00 00 00	r1 <<= r7
      27:	61 02 00 00 00 00 00 00	r2 = *(u32 *)(r0 + 0)
      28:	5f 12 00 00 00 00 00 00	r2 &= r1
      29:	b7 06 00 00 02 00 00 00	r6 = 2
      30:	15 02 11 00 00 00 00 00	if r2 == 0 goto +17 <LBB0_13>
      31:	18 02 00 00 00 00 00 00 00 00 00 00 00 00 00 00	r2 = 0 ll
      33:	15 07 01 00 00 00 00 00	if r7 == 0 goto +1 <LBB0_8>
      34:	b7 02 00 00 00 00 00 00	r2 = 0

0000000000000118 <LBB0_8>:
      35:	18 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00	r1 = 0 ll
      37:	55 07 01 00 00 00 00 00	if r7 != 0 goto +1 <LBB0_10>
      38:	bf 21 00 00 00 00 00 00	r1 = r2

0000000000000138 <LBB0_10>:
      39:	b7 06 00 00 01 00 00 00	r6 = 1
      40:	15 01 07 00 00 00 00 00	if r1 == 0 goto +7 <LBB0_13>
      41:	bf a2 00 00 00 00 00 00	r2 = r10
      42:	07 02 00 00 fc ff ff ff	r2 += -4
      43:	85 00 00 00 01 00 00 00	call 1
      44:	15 00 03 00 00 00 00 00	if r0 == 0 goto +3 <LBB0_13>
      45:	61 01 00 00 00 00 00 00	r1 = *(u32 *)(r0 + 0)
      46:	07 01 00 00 01 00 00 00	r1 += 1
      47:	63 10 00 00 00 00 00 00	*(u32 *)(r0 + 0) = r1

0000000000000180 <LBB0_13>:
      48:	bf 60 00 00 00 00 00 00	r0 = r6
      49:	95 00 00 00 00 00 00 00	exit

Disassembly of section xdp_prog:

0000000000000000 <xdp_program>:
       0:	bf 17 00 00 00 00 00 00	r7 = r1
       1:	b7 06 00 00 02 00 00 00	r6 = 2
       2:	61 71 04 00 00 00 00 00	r1 = *(u32 *)(r7 + 4)
       3:	61 78 00 00 00 00 00 00	r8 = *(u32 *)(r7 + 0)
       4:	bf 82 00 00 00 00 00 00	r2 = r8
       5:	07 02 00 00 0e 00 00 00	r2 += 14
       6:	2d 12 3b 00 00 00 00 00	if r2 > r1 goto +59 <LBB1_29>
       7:	71 83 0c 00 00 00 00 00	r3 = *(u8 *)(r8 + 12)
       8:	71 82 0d 00 00 00 00 00	r2 = *(u8 *)(r8 + 13)
       9:	67 02 00 00 08 00 00 00	r2 <<= 8
      10:	4f 32 00 00 00 00 00 00	r2 |= r3
      11:	bf 23 00 00 00 00 00 00	r3 = r2
      12:	57 03 00 00 ff 00 00 00	r3 &= 255
      13:	b7 04 00 00 06 00 00 00	r4 = 6
      14:	2d 34 33 00 00 00 00 00	if r4 > r3 goto +51 <LBB1_29>
      15:	15 02 02 00 88 a8 00 00	if r2 == 43144 goto +2 <LBB1_4>
      16:	b7 03 00 00 0e 00 00 00	r3 = 14
      17:	55 02 05 00 81 00 00 00	if r2 != 129 goto +5 <LBB1_6>

0000000000000090 <LBB1_4>:
      18:	bf 82 00 00 00 00 00 00	r2 = r8
      19:	07 02 00 00 12 00 00 00	r2 += 18
      20:	2d 12 2d 00 00 00 00 00	if r2 > r1 goto +45 <LBB1_29>
      21:	b7 03 00 00 12 00 00 00	r3 = 18
      22:	69 82 10 00 00 00 00 00	r2 = *(u16 *)(r8 + 16)

00000000000000b8 <LBB1_6>:
      23:	bf 24 00 00 00 00 00 00	r4 = r2
      24:	57 04 00 00 ff ff 00 00	r4 &= 65535
      25:	15 04 01 00 88 a8 00 00	if r4 == 43144 goto +1 <LBB1_8>
      26:	55 04 09 00 81 00 00 00	if r4 != 129 goto +9 <LBB1_10>

00000000000000d8 <LBB1_8>:
      27:	bf 34 00 00 00 00 00 00	r4 = r3
      28:	07 04 00 00 04 00 00 00	r4 += 4
      29:	bf 82 00 00 00 00 00 00	r2 = r8
      30:	0f 42 00 00 00 00 00 00	r2 += r4
      31:	2d 12 22 00 00 00 00 00	if r2 > r1 goto +34 <LBB1_29>
      32:	bf 82 00 00 00 00 00 00	r2 = r8
      33:	0f 32 00 00 00 00 00 00	r2 += r3
      34:	69 22 02 00 00 00 00 00	r2 = *(u16 *)(r2 + 2)
      35:	bf 43 00 00 00 00 00 00	r3 = r4

0000000000000120 <LBB1_10>:
      36:	b7 06 00 00 02 00 00 00	r6 = 2
      37:	57 02 00 00 ff ff 00 00	r2 &= 65535
      38:	55 02 11 00 08 00 00 00	if r2 != 8 goto +17 <LBB1_27>
      39:	0f 38 00 00 00 00 00 00	r8 += r3
      40:	b7 06 00 00 00 00 00 00	r6 = 0
      41:	bf 89 00 00 00 00 00 00	r9 = r8
      42:	07 09 00 00 14 00 00 00	r9 += 20
      43:	2d 19 0c 00 00 00 00 00	if r9 > r1 goto +12 <LBB1_27>
      44:	61 81 0c 00 00 00 00 00	r1 = *(u32 *)(r8 + 12)
      45:	63 1a f8 ff 00 00 00 00	*(u32 *)(r10 - 8) = r1
      46:	bf a2 00 00 00 00 00 00	r2 = r10
      47:	07 02 00 00 f8 ff ff ff	r2 += -8
      48:	18 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00	r1 = 0 ll
      50:	85 00 00 00 01 00 00 00	call 1
      51:	15 00 10 00 00 00 00 00	if r0 == 0 goto +16 <LBB1_14>
      52:	79 01 00 00 00 00 00 00	r1 = *(u64 *)(r0 + 0)
      53:	07 01 00 00 01 00 00 00	r1 += 1
      54:	7b 10 00 00 00 00 00 00	*(u64 *)(r0 + 0) = r1
      55:	b7 06 00 00 01 00 00 00	r6 = 1

00000000000001c0 <LBB1_27>:
      56:	63 6a f4 ff 00 00 00 00	*(u32 *)(r10 - 12) = r6
      57:	bf a2 00 00 00 00 00 00	r2 = r10
      58:	07 02 00 00 f4 ff ff ff	r2 += -12
      59:	18 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00	r1 = 0 ll
      61:	85 00 00 00 01 00 00 00	call 1
      62:	15 00 03 00 00 00 00 00	if r0 == 0 goto +3 <LBB1_29>
      63:	79 01 00 00 00 00 00 00	r1 = *(u64 *)(r0 + 0)
      64:	07 01 00 00 01 00 00 00	r1 += 1
      65:	7b 10 00 00 00 00 00 00	*(u64 *)(r0 + 0) = r1

0000000000000210 <LBB1_29>:
      66:	bf 60 00 00 00 00 00 00	r0 = r6
      67:	95 00 00 00 00 00 00 00	exit

0000000000000220 <LBB1_14>:
      68:	61 71 04 00 00 00 00 00	r1 = *(u32 *)(r7 + 4)
      69:	71 82 09 00 00 00 00 00	r2 = *(u8 *)(r8 + 9)
      70:	15 02 08 00 06 00 00 00	if r2 == 6 goto +8 <LBB1_17>
      71:	b7 06 00 00 02 00 00 00	r6 = 2
      72:	55 02 ef ff 11 00 00 00	if r2 != 17 goto -17 <LBB1_27>
      73:	b7 07 00 00 01 00 00 00	r7 = 1
      74:	b7 06 00 00 00 00 00 00	r6 = 0
      75:	bf 92 00 00 00 00 00 00	r2 = r9
      76:	07 02 00 00 08 00 00 00	r2 += 8
      77:	2d 12 ea ff 00 00 00 00	if r2 > r1 goto -22 <LBB1_27>
      78:	05 00 05 00 00 00 00 00	goto +5 <LBB1_18>

0000000000000278 <LBB1_17>:
      79:	b7 07 00 00 00 00 00 00	r7 = 0
      80:	bf 92 00 00 00 00 00 00	r2 = r9
      81:	07 02 00 00 14 00 00 00	r2 += 20
      82:	b7 06 00 00 00 00 00 00	r6 = 0
      83:	2d 12 e4 ff 00 00 00 00	if r2 > r1 goto -28 <LBB1_27>

00000000000002a0 <LBB1_18>:
      84:	69 91 02 00 00 00 00 00	r1 = *(u16 *)(r9 + 2)
      85:	dc 01 00 00 10 00 00 00	r1 = be16 r1
      86:	63 1a fc ff 00 00 00 00	*(u32 *)(r10 - 4) = r1
      87:	bf a2 00 00 00 00 00 00	r2 = r10
      88:	07 02 00 00 fc ff ff ff	r2 += -4
      89:	18 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00	r1 = 0 ll
      91:	85 00 00 00 01 00 00 00	call 1
      92:	b7 06 00 00 02 00 00 00	r6 = 2
      93:	15 00 da ff 00 00 00 00	if r0 == 0 goto -38 <LBB1_27>
      94:	b7 01 00 00 01 00 00 00	r1 = 1
      95:	6f 71 00 00 00 00 00 00	r1 <<= r7
      96:	61 02 00 00 00 00 00 00	r2 = *(u32 *)(r0 + 0)
      97:	5f 12 00 00 00 00 00 00	r2 &= r1
      98:	b7 06 00 00 02 00 00 00	r6 = 2
      99:	15 02 d4 ff 00 00 00 00	if r2 == 0 goto -44 <LBB1_27>
     100:	18 02 00 00 00 00 00 00 00 00 00 00 00 00 00 00	r2 = 0 ll
     102:	15 07 01 00 00 00 00 00	if r7 == 0 goto +1 <LBB1_22>
     103:	b7 02 00 00 00 00 00 00	r2 = 0

0000000000000340 <LBB1_22>:
     104:	18 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00	r1 = 0 ll
     106:	55 07 01 00 00 00 00 00	if r7 != 0 goto +1 <LBB1_24>
     107:	bf 21 00 00 00 00 00 00	r1 = r2

0000000000000360 <LBB1_24>:
     108:	b7 06 00 00 01 00 00 00	r6 = 1
     109:	15 01 ca ff 00 00 00 00	if r1 == 0 goto -54 <LBB1_27>
     110:	bf a2 00 00 00 00 00 00	r2 = r10
     111:	07 02 00 00 fc ff ff ff	r2 += -4
     112:	85 00 00 00 01 00 00 00	call 1
     113:	15 00 c6 ff 00 00 00 00	if r0 == 0 goto -58 <LBB1_27>
     114:	61 01 00 00 00 00 00 00	r1 = *(u32 *)(r0 + 0)
     115:	07 01 00 00 01 00 00 00	r1 += 1
     116:	63 10 00 00 00 00 00 00	*(u32 *)(r0 + 0) = r1
     117:	05 00 c2 ff 00 00 00 00	goto -62 <LBB1_27>
