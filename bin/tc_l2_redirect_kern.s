
./ebpf-samples/all/tc_l2_redirect_kern.o:	file format elf64-bpf

Disassembly of section l2_to_iptun_ingress_forward:

0000000000000000 <_l2_to_iptun_ingress_forward>:
       0:	61 19 50 00 00 00 00 00	r9 = *(u32 *)(r1 + 80)
       1:	61 18 4c 00 00 00 00 00	r8 = *(u32 *)(r1 + 76)
       2:	b7 07 00 00 00 00 00 00	r7 = 0
       3:	63 7a fc ff 00 00 00 00	*(u32 *)(r10 - 4) = r7
       4:	bf 81 00 00 00 00 00 00	r1 = r8
       5:	07 01 00 00 0e 00 00 00	r1 += 14
       6:	2d 91 4e 00 00 00 00 00	if r1 > r9 goto +78 <LBB0_12>
       7:	bf a2 00 00 00 00 00 00	r2 = r10
       8:	07 02 00 00 fc ff ff ff	r2 += -4
       9:	18 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00	r1 = 0 ll
      11:	85 00 00 00 01 00 00 00	call 1
      12:	bf 06 00 00 00 00 00 00	r6 = r0
      13:	15 06 47 00 00 00 00 00	if r6 == 0 goto +71 <LBB0_12>
      14:	69 81 0c 00 00 00 00 00	r1 = *(u16 *)(r8 + 12)
      15:	15 01 1f 00 86 dd 00 00	if r1 == 56710 goto +31 <LBB0_7>
      16:	55 01 44 00 08 00 00 00	if r1 != 8 goto +68 <LBB0_12>
      17:	18 01 00 00 64 64 72 34 00 00 00 00 3a 25 78 0a	r1 = 754393869502800996 ll
      19:	7b 1a e0 ff 00 00 00 00	*(u64 *)(r10 - 32) = r1
      20:	18 01 00 00 65 78 3a 25 00 00 00 00 64 20 64 61	r1 = 7017769733843482725 ll
      22:	7b 1a d8 ff 00 00 00 00	*(u64 *)(r10 - 40) = r1
      23:	18 01 00 00 74 6f 20 69 00 00 00 00 66 69 6e 64	r1 = 7236837539802279796 ll
      25:	7b 1a d0 ff 00 00 00 00	*(u64 *)(r10 - 48) = r1
      26:	18 01 00 00 66 6f 72 77 00 00 00 00 61 72 64 20	r1 = 2334116269826142054 ll
      28:	7b 1a c8 ff 00 00 00 00	*(u64 *)(r10 - 56) = r1
      29:	18 01 00 00 69 6e 67 72 00 00 00 00 65 73 73 20	r1 = 2338339511083691625 ll
      31:	7b 1a c0 ff 00 00 00 00	*(u64 *)(r10 - 64) = r1
      32:	b7 07 00 00 00 00 00 00	r7 = 0
      33:	73 7a e8 ff 00 00 00 00	*(u8 *)(r10 - 24) = r7
      34:	bf 81 00 00 00 00 00 00	r1 = r8
      35:	07 01 00 00 22 00 00 00	r1 += 34
      36:	2d 91 30 00 00 00 00 00	if r1 > r9 goto +48 <LBB0_12>
      37:	71 81 17 00 00 00 00 00	r1 = *(u8 *)(r8 + 23)
      38:	55 01 2e 00 04 00 00 00	if r1 != 4 goto +46 <LBB0_12>
      39:	61 84 1e 00 00 00 00 00	r4 = *(u32 *)(r8 + 30)
      40:	61 63 00 00 00 00 00 00	r3 = *(u32 *)(r6 + 0)
      41:	dc 04 00 00 20 00 00 00	r4 = be32 r4
      42:	bf a1 00 00 00 00 00 00	r1 = r10
      43:	07 01 00 00 c0 ff ff ff	r1 += -64
      44:	b7 02 00 00 29 00 00 00	r2 = 41
      45:	85 00 00 00 06 00 00 00	call 6
      46:	05 00 22 00 00 00 00 00	goto +34 <LBB0_11>

0000000000000178 <LBB0_7>:
      47:	b7 01 00 00 3a 25 78 0a	r1 = 175646010
      48:	63 1a e8 ff 00 00 00 00	*(u32 *)(r10 - 24) = r1
      49:	18 01 00 00 64 64 72 36 00 00 00 00 3a 25 78 3a	r1 = 4213158383356896356 ll
      51:	7b 1a e0 ff 00 00 00 00	*(u64 *)(r10 - 32) = r1
      52:	18 01 00 00 65 78 3a 25 00 00 00 00 64 20 64 61	r1 = 7017769733843482725 ll
      54:	7b 1a d8 ff 00 00 00 00	*(u64 *)(r10 - 40) = r1
      55:	18 01 00 00 74 6f 20 69 00 00 00 00 66 69 6e 64	r1 = 7236837539802279796 ll
      57:	7b 1a d0 ff 00 00 00 00	*(u64 *)(r10 - 48) = r1
      58:	18 01 00 00 66 6f 72 77 00 00 00 00 61 72 64 20	r1 = 2334116269826142054 ll
      60:	7b 1a c8 ff 00 00 00 00	*(u64 *)(r10 - 56) = r1
      61:	18 01 00 00 69 6e 67 72 00 00 00 00 65 73 73 20	r1 = 2338339511083691625 ll
      63:	7b 1a c0 ff 00 00 00 00	*(u64 *)(r10 - 64) = r1
      64:	b7 07 00 00 00 00 00 00	r7 = 0
      65:	73 7a ec ff 00 00 00 00	*(u8 *)(r10 - 20) = r7
      66:	bf 81 00 00 00 00 00 00	r1 = r8
      67:	07 01 00 00 36 00 00 00	r1 += 54
      68:	2d 91 10 00 00 00 00 00	if r1 > r9 goto +16 <LBB0_12>
      69:	71 81 14 00 00 00 00 00	r1 = *(u8 *)(r8 + 20)
      70:	15 01 01 00 29 00 00 00	if r1 == 41 goto +1 <LBB0_10>
      71:	55 01 0d 00 04 00 00 00	if r1 != 4 goto +13 <LBB0_12>

0000000000000240 <LBB0_10>:
      72:	61 85 32 00 00 00 00 00	r5 = *(u32 *)(r8 + 50)
      73:	61 84 26 00 00 00 00 00	r4 = *(u32 *)(r8 + 38)
      74:	61 63 00 00 00 00 00 00	r3 = *(u32 *)(r6 + 0)
      75:	dc 04 00 00 20 00 00 00	r4 = be32 r4
      76:	dc 05 00 00 20 00 00 00	r5 = be32 r5
      77:	bf a1 00 00 00 00 00 00	r1 = r10
      78:	07 01 00 00 c0 ff ff ff	r1 += -64
      79:	b7 02 00 00 2d 00 00 00	r2 = 45
      80:	85 00 00 00 06 00 00 00	call 6

0000000000000288 <LBB0_11>:
      81:	61 61 00 00 00 00 00 00	r1 = *(u32 *)(r6 + 0)
      82:	b7 02 00 00 01 00 00 00	r2 = 1
      83:	85 00 00 00 17 00 00 00	call 23
      84:	bf 07 00 00 00 00 00 00	r7 = r0

00000000000002a8 <LBB0_12>:
      85:	bf 70 00 00 00 00 00 00	r0 = r7
      86:	95 00 00 00 00 00 00 00	exit

Disassembly of section l2_to_iptun_ingress_redirect:

0000000000000000 <_l2_to_iptun_ingress_redirect>:
       0:	bf 16 00 00 00 00 00 00	r6 = r1
       1:	b7 07 00 00 00 00 00 00	r7 = 0
       2:	63 7a f8 ff 00 00 00 00	*(u32 *)(r10 - 8) = r7
       3:	7b 7a f0 ff 00 00 00 00	*(u64 *)(r10 - 16) = r7
       4:	7b 7a e8 ff 00 00 00 00	*(u64 *)(r10 - 24) = r7
       5:	7b 7a e0 ff 00 00 00 00	*(u64 *)(r10 - 32) = r7
       6:	61 68 50 00 00 00 00 00	r8 = *(u32 *)(r6 + 80)
       7:	61 69 4c 00 00 00 00 00	r9 = *(u32 *)(r6 + 76)
       8:	63 7a dc ff 00 00 00 00	*(u32 *)(r10 - 36) = r7
       9:	bf 91 00 00 00 00 00 00	r1 = r9
      10:	07 01 00 00 0e 00 00 00	r1 += 14
      11:	2d 81 3d 00 00 00 00 00	if r1 > r8 goto +61 <LBB1_9>
      12:	bf a2 00 00 00 00 00 00	r2 = r10
      13:	07 02 00 00 dc ff ff ff	r2 += -36
      14:	18 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00	r1 = 0 ll
      16:	85 00 00 00 01 00 00 00	call 1
      17:	15 00 37 00 00 00 00 00	if r0 == 0 goto +55 <LBB1_9>
      18:	69 91 0c 00 00 00 00 00	r1 = *(u16 *)(r9 + 12)
      19:	55 01 35 00 08 00 00 00	if r1 != 8 goto +53 <LBB1_9>
      20:	b7 01 00 00 25 64 0a 00	r1 = 680997
      21:	63 1a d8 ff 00 00 00 00	*(u32 *)(r10 - 40) = r1
      22:	18 01 00 00 69 66 69 6e 00 00 00 00 64 65 78 3a	r1 = 4213228933428635241 ll
      24:	7b 1a d0 ff 00 00 00 00	*(u64 *)(r10 - 48) = r1
      25:	18 01 00 00 34 3a 25 78 00 00 00 00 20 74 6f 20	r1 = 2337214414432057908 ll
      27:	7b 1a c8 ff 00 00 00 00	*(u64 *)(r10 - 56) = r1
      28:	18 01 00 00 63 74 20 64 00 00 00 00 61 64 64 72	r1 = 8242823587449304163 ll
      30:	7b 1a c0 ff 00 00 00 00	*(u64 *)(r10 - 64) = r1
      31:	18 01 00 00 73 20 72 65 00 00 00 00 64 69 72 65	r1 = 7310021025095360627 ll
      33:	7b 1a b8 ff 00 00 00 00	*(u64 *)(r10 - 72) = r1
      34:	18 01 00 00 65 2f 69 6e 00 00 00 00 67 72 65 73	r1 = 8315178075569074021 ll
      36:	7b 1a b0 ff 00 00 00 00	*(u64 *)(r10 - 80) = r1
      37:	bf 91 00 00 00 00 00 00	r1 = r9
      38:	07 01 00 00 22 00 00 00	r1 += 34
      39:	2d 81 21 00 00 00 00 00	if r1 > r8 goto +33 <LBB1_9>
      40:	61 93 1e 00 00 00 00 00	r3 = *(u32 *)(r9 + 30)
      41:	69 91 0c 00 00 00 00 00	r1 = *(u16 *)(r9 + 12)
      42:	15 01 05 00 86 dd 00 00	if r1 == 56710 goto +5 <LBB1_7>
      43:	55 01 1d 00 08 00 00 00	if r1 != 8 goto +29 <LBB1_9>
      44:	bf 31 00 00 00 00 00 00	r1 = r3
      45:	57 01 00 00 ff ff ff 00	r1 &= 16777215
      46:	15 01 04 00 0a 0a 01 00	if r1 == 68106 goto +4 <LBB1_8>
      47:	05 00 19 00 00 00 00 00	goto +25 <LBB1_9>

0000000000000180 <LBB1_7>:
      48:	18 01 00 00 24 01 fa ce 00 00 00 00 00 00 00 00	r1 = 3472490788 ll
      50:	5d 13 16 00 00 00 00 00	if r3 != r1 goto +22 <LBB1_9>

0000000000000198 <LBB1_8>:
      51:	61 04 00 00 00 00 00 00	r4 = *(u32 *)(r0 + 0)
      52:	dc 03 00 00 20 00 00 00	r3 = be32 r3
      53:	bf a1 00 00 00 00 00 00	r1 = r10
      54:	07 01 00 00 b0 ff ff ff	r1 += -80
      55:	b7 02 00 00 2c 00 00 00	r2 = 44
      56:	bf 07 00 00 00 00 00 00	r7 = r0
      57:	85 00 00 00 06 00 00 00	call 6
      58:	b7 01 00 00 40 00 00 00	r1 = 64
      59:	73 1a f5 ff 00 00 00 00	*(u8 *)(r10 - 11) = r1
      60:	18 01 00 00 10 27 00 00 00 00 00 00 66 01 02 0a	r1 = 721140427931002640 ll
      62:	7b 1a e0 ff 00 00 00 00	*(u64 *)(r10 - 32) = r1
      63:	bf a2 00 00 00 00 00 00	r2 = r10
      64:	07 02 00 00 e0 ff ff ff	r2 += -32
      65:	bf 61 00 00 00 00 00 00	r1 = r6
      66:	b7 03 00 00 1c 00 00 00	r3 = 28
      67:	b7 04 00 00 00 00 00 00	r4 = 0
      68:	85 00 00 00 15 00 00 00	call 21
      69:	61 71 00 00 00 00 00 00	r1 = *(u32 *)(r7 + 0)
      70:	b7 02 00 00 00 00 00 00	r2 = 0
      71:	85 00 00 00 17 00 00 00	call 23
      72:	bf 07 00 00 00 00 00 00	r7 = r0

0000000000000248 <LBB1_9>:
      73:	bf 70 00 00 00 00 00 00	r0 = r7
      74:	95 00 00 00 00 00 00 00	exit

Disassembly of section l2_to_ip6tun_ingress_redirect:

0000000000000000 <_l2_to_ip6tun_ingress_redirect>:
       0:	bf 16 00 00 00 00 00 00	r6 = r1
       1:	b7 08 00 00 00 00 00 00	r8 = 0
       2:	63 8a f8 ff 00 00 00 00	*(u32 *)(r10 - 8) = r8
       3:	7b 8a f0 ff 00 00 00 00	*(u64 *)(r10 - 16) = r8
       4:	7b 8a e8 ff 00 00 00 00	*(u64 *)(r10 - 24) = r8
       5:	7b 8a e0 ff 00 00 00 00	*(u64 *)(r10 - 32) = r8
       6:	61 67 50 00 00 00 00 00	r7 = *(u32 *)(r6 + 80)
       7:	61 69 4c 00 00 00 00 00	r9 = *(u32 *)(r6 + 76)
       8:	63 8a dc ff 00 00 00 00	*(u32 *)(r10 - 36) = r8
       9:	bf 91 00 00 00 00 00 00	r1 = r9
      10:	07 01 00 00 0e 00 00 00	r1 += 14
      11:	2d 71 62 00 00 00 00 00	if r1 > r7 goto +98 <LBB2_10>
      12:	bf a2 00 00 00 00 00 00	r2 = r10
      13:	07 02 00 00 dc ff ff ff	r2 += -36
      14:	18 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00	r1 = 0 ll
      16:	85 00 00 00 01 00 00 00	call 1
      17:	15 00 5c 00 00 00 00 00	if r0 == 0 goto +92 <LBB2_10>
      18:	69 91 0c 00 00 00 00 00	r1 = *(u16 *)(r9 + 12)
      19:	15 01 1d 00 86 dd 00 00	if r1 == 56710 goto +29 <LBB2_11>
      20:	55 01 59 00 08 00 00 00	if r1 != 8 goto +89 <LBB2_10>
      21:	b7 01 00 00 25 64 0a 00	r1 = 680997
      22:	63 1a d8 ff 00 00 00 00	*(u32 *)(r10 - 40) = r1
      23:	18 01 00 00 69 66 69 6e 00 00 00 00 64 65 78 3a	r1 = 4213228933428635241 ll
      25:	7b 1a d0 ff 00 00 00 00	*(u64 *)(r10 - 48) = r1
      26:	18 01 00 00 34 3a 25 78 00 00 00 00 20 74 6f 20	r1 = 2337214414432057908 ll
      28:	7b 1a c8 ff 00 00 00 00	*(u64 *)(r10 - 56) = r1
      29:	18 01 00 00 63 74 20 64 00 00 00 00 61 64 64 72	r1 = 8242823587449304163 ll
      31:	7b 1a c0 ff 00 00 00 00	*(u64 *)(r10 - 64) = r1
      32:	18 01 00 00 73 20 72 65 00 00 00 00 64 69 72 65	r1 = 7310021025095360627 ll
      34:	7b 1a b8 ff 00 00 00 00	*(u64 *)(r10 - 72) = r1
      35:	18 01 00 00 65 2f 69 6e 00 00 00 00 67 72 65 73	r1 = 8315178075569074021 ll
      37:	7b 1a b0 ff 00 00 00 00	*(u64 *)(r10 - 80) = r1
      38:	bf 91 00 00 00 00 00 00	r1 = r9
      39:	07 01 00 00 22 00 00 00	r1 += 34
      40:	2d 71 45 00 00 00 00 00	if r1 > r7 goto +69 <LBB2_10>
      41:	61 93 1e 00 00 00 00 00	r3 = *(u32 *)(r9 + 30)
      42:	69 91 0c 00 00 00 00 00	r1 = *(u16 *)(r9 + 12)
      43:	15 01 25 00 86 dd 00 00	if r1 == 56710 goto +37 <LBB2_8>
      44:	55 01 41 00 08 00 00 00	if r1 != 8 goto +65 <LBB2_10>
      45:	bf 31 00 00 00 00 00 00	r1 = r3
      46:	57 01 00 00 ff ff ff 00	r1 &= 16777215
      47:	15 01 24 00 0a 0a 01 00	if r1 == 68106 goto +36 <LBB2_9>
      48:	05 00 3d 00 00 00 00 00	goto +61 <LBB2_10>

0000000000000188 <LBB2_11>:
      49:	b7 01 00 00 25 64 0a 00	r1 = 680997
      50:	63 1a d8 ff 00 00 00 00	*(u32 *)(r10 - 40) = r1
      51:	18 01 00 00 69 66 69 6e 00 00 00 00 64 65 78 3a	r1 = 4213228933428635241 ll
      53:	7b 1a d0 ff 00 00 00 00	*(u64 *)(r10 - 48) = r1
      54:	18 01 00 00 36 3a 25 78 00 00 00 00 20 74 6f 20	r1 = 2337214414432057910 ll
      56:	7b 1a c8 ff 00 00 00 00	*(u64 *)(r10 - 56) = r1
      57:	18 01 00 00 63 74 20 64 00 00 00 00 61 64 64 72	r1 = 8242823587449304163 ll
      59:	7b 1a c0 ff 00 00 00 00	*(u64 *)(r10 - 64) = r1
      60:	18 01 00 00 73 20 72 65 00 00 00 00 64 69 72 65	r1 = 7310021025095360627 ll
      62:	7b 1a b8 ff 00 00 00 00	*(u64 *)(r10 - 72) = r1
      63:	18 01 00 00 65 2f 69 6e 00 00 00 00 67 72 65 73	r1 = 8315178075569074021 ll
      65:	7b 1a b0 ff 00 00 00 00	*(u64 *)(r10 - 80) = r1
      66:	bf 91 00 00 00 00 00 00	r1 = r9
      67:	07 01 00 00 36 00 00 00	r1 += 54
      68:	2d 71 29 00 00 00 00 00	if r1 > r7 goto +41 <LBB2_10>
      69:	61 93 26 00 00 00 00 00	r3 = *(u32 *)(r9 + 38)
      70:	69 91 0c 00 00 00 00 00	r1 = *(u16 *)(r9 + 12)
      71:	15 01 05 00 86 dd 00 00	if r1 == 56710 goto +5 <LBB2_15>
      72:	55 01 25 00 08 00 00 00	if r1 != 8 goto +37 <LBB2_10>
      73:	bf 31 00 00 00 00 00 00	r1 = r3
      74:	57 01 00 00 ff ff ff 00	r1 &= 16777215
      75:	15 01 04 00 0a 0a 01 00	if r1 == 68106 goto +4 <LBB2_16>
      76:	05 00 21 00 00 00 00 00	goto +33 <LBB2_10>

0000000000000268 <LBB2_15>:
      77:	18 01 00 00 24 01 fa ce 00 00 00 00 00 00 00 00	r1 = 3472490788 ll
      79:	5d 13 1e 00 00 00 00 00	if r3 != r1 goto +30 <LBB2_10>

0000000000000280 <LBB2_16>:
      80:	05 00 03 00 00 00 00 00	goto +3 <LBB2_9>

0000000000000288 <LBB2_8>:
      81:	18 01 00 00 24 01 fa ce 00 00 00 00 00 00 00 00	r1 = 3472490788 ll
      83:	5d 13 1a 00 00 00 00 00	if r3 != r1 goto +26 <LBB2_10>

00000000000002a0 <LBB2_9>:
      84:	61 04 00 00 00 00 00 00	r4 = *(u32 *)(r0 + 0)
      85:	dc 03 00 00 20 00 00 00	r3 = be32 r3
      86:	bf a1 00 00 00 00 00 00	r1 = r10
      87:	07 01 00 00 b0 ff ff ff	r1 += -80
      88:	b7 02 00 00 2c 00 00 00	r2 = 44
      89:	bf 07 00 00 00 00 00 00	r7 = r0
      90:	85 00 00 00 06 00 00 00	call 6
      91:	18 01 00 00 10 27 00 00 00 00 00 00 24 01 db 02	r1 = 205759462105949968 ll
      93:	7b 1a e0 ff 00 00 00 00	*(u64 *)(r10 - 32) = r1
      94:	b7 01 00 00 40 00 00 00	r1 = 64
      95:	73 1a f5 ff 00 00 00 00	*(u8 *)(r10 - 11) = r1
      96:	b7 01 00 00 00 00 00 66	r1 = 1711276032
      97:	63 1a f0 ff 00 00 00 00	*(u32 *)(r10 - 16) = r1
      98:	b7 01 00 00 00 00 00 00	r1 = 0
      99:	7b 1a e8 ff 00 00 00 00	*(u64 *)(r10 - 24) = r1
     100:	bf a2 00 00 00 00 00 00	r2 = r10
     101:	07 02 00 00 e0 ff ff ff	r2 += -32
     102:	bf 61 00 00 00 00 00 00	r1 = r6
     103:	b7 03 00 00 1c 00 00 00	r3 = 28
     104:	b7 04 00 00 01 00 00 00	r4 = 1
     105:	85 00 00 00 15 00 00 00	call 21
     106:	61 71 00 00 00 00 00 00	r1 = *(u32 *)(r7 + 0)
     107:	b7 02 00 00 00 00 00 00	r2 = 0
     108:	85 00 00 00 17 00 00 00	call 23
     109:	bf 08 00 00 00 00 00 00	r8 = r0

0000000000000370 <LBB2_10>:
     110:	bf 80 00 00 00 00 00 00	r0 = r8
     111:	95 00 00 00 00 00 00 00	exit

Disassembly of section drop_non_tun_vip:

0000000000000000 <_drop_non_tun_vip>:
       0:	b7 00 00 00 00 00 00 00	r0 = 0
       1:	61 12 50 00 00 00 00 00	r2 = *(u32 *)(r1 + 80)
       2:	61 11 4c 00 00 00 00 00	r1 = *(u32 *)(r1 + 76)
       3:	bf 13 00 00 00 00 00 00	r3 = r1
       4:	07 03 00 00 0e 00 00 00	r3 += 14
       5:	2d 23 14 00 00 00 00 00	if r3 > r2 goto +20 <LBB3_8>
       6:	69 13 0c 00 00 00 00 00	r3 = *(u16 *)(r1 + 12)
       7:	15 03 09 00 86 dd 00 00	if r3 == 56710 goto +9 <LBB3_5>
       8:	55 03 10 00 08 00 00 00	if r3 != 8 goto +16 <LBB3_7>
       9:	bf 13 00 00 00 00 00 00	r3 = r1
      10:	07 03 00 00 22 00 00 00	r3 += 34
      11:	2d 23 0e 00 00 00 00 00	if r3 > r2 goto +14 <LBB3_8>
      12:	b7 00 00 00 02 00 00 00	r0 = 2
      13:	61 11 1e 00 00 00 00 00	r1 = *(u32 *)(r1 + 30)
      14:	57 01 00 00 ff ff ff 00	r1 &= 16777215
      15:	15 01 0a 00 0a 0a 01 00	if r1 == 68106 goto +10 <LBB3_8>
      16:	05 00 08 00 00 00 00 00	goto +8 <LBB3_7>

0000000000000088 <LBB3_5>:
      17:	bf 13 00 00 00 00 00 00	r3 = r1
      18:	07 03 00 00 36 00 00 00	r3 += 54
      19:	2d 23 06 00 00 00 00 00	if r3 > r2 goto +6 <LBB3_8>
      20:	b7 00 00 00 02 00 00 00	r0 = 2
      21:	61 11 26 00 00 00 00 00	r1 = *(u32 *)(r1 + 38)
      22:	18 02 00 00 24 01 fa ce 00 00 00 00 00 00 00 00	r2 = 3472490788 ll
      24:	1d 21 01 00 00 00 00 00	if r1 == r2 goto +1 <LBB3_8>

00000000000000c8 <LBB3_7>:
      25:	b7 00 00 00 00 00 00 00	r0 = 0

00000000000000d0 <LBB3_8>:
      26:	95 00 00 00 00 00 00 00	exit
