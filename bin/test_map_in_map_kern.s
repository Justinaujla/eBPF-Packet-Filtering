
./ebpf-samples/all/test_map_in_map_kern.o:	file format elf64-bpf

Disassembly of section kprobe/sys_connect:

0000000000000000 <trace_sys_connect>:
       0:	b7 02 00 00 00 00 00 00	r2 = 0
       1:	63 2a d8 ff 00 00 00 00	*(u32 *)(r10 - 40) = r2
       2:	61 12 60 00 00 00 00 00	r2 = *(u32 *)(r1 + 96)
       3:	55 02 2f 00 1c 00 00 00	if r2 != 28 goto +47 <LBB0_8>
       4:	79 16 68 00 00 00 00 00	r6 = *(u64 *)(r1 + 104)
       5:	bf 63 00 00 00 00 00 00	r3 = r6
       6:	07 03 00 00 08 00 00 00	r3 += 8
       7:	bf a1 00 00 00 00 00 00	r1 = r10
       8:	07 01 00 00 e0 ff ff ff	r1 += -32
       9:	b7 02 00 00 10 00 00 00	r2 = 16
      10:	85 00 00 00 04 00 00 00	call 4
      11:	63 0a dc ff 00 00 00 00	*(u32 *)(r10 - 36) = r0
      12:	bf 01 00 00 00 00 00 00	r1 = r0
      13:	67 01 00 00 20 00 00 00	r1 <<= 32
      14:	77 01 00 00 20 00 00 00	r1 >>= 32
      15:	15 01 12 00 00 00 00 00	if r1 == 0 goto +18 <LBB0_4>

0000000000000080 <LBB0_2>:
      16:	63 0a fc ff 00 00 00 00	*(u32 *)(r10 - 4) = r0

0000000000000088 <LBB0_3>:
      17:	bf a6 00 00 00 00 00 00	r6 = r10
      18:	07 06 00 00 d8 ff ff ff	r6 += -40
      19:	bf a3 00 00 00 00 00 00	r3 = r10
      20:	07 03 00 00 dc ff ff ff	r3 += -36
      21:	18 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00	r1 = 0 ll
      23:	bf 62 00 00 00 00 00 00	r2 = r6
      24:	b7 04 00 00 00 00 00 00	r4 = 0
      25:	85 00 00 00 02 00 00 00	call 2
      26:	bf a3 00 00 00 00 00 00	r3 = r10
      27:	07 03 00 00 fc ff ff ff	r3 += -4
      28:	18 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00	r1 = 0 ll
      30:	bf 62 00 00 00 00 00 00	r2 = r6
      31:	b7 04 00 00 00 00 00 00	r4 = 0
      32:	85 00 00 00 02 00 00 00	call 2
      33:	05 00 11 00 00 00 00 00	goto +17 <LBB0_8>

0000000000000110 <LBB0_4>:
      34:	69 a1 e0 ff 00 00 00 00	r1 = *(u16 *)(r10 - 32)
      35:	55 01 0f 00 ad de 00 00	if r1 != 57005 goto +15 <LBB0_8>
      36:	69 a1 e2 ff 00 00 00 00	r1 = *(u16 *)(r10 - 30)
      37:	55 01 0d 00 ef be 00 00	if r1 != 48879 goto +13 <LBB0_8>
      38:	69 a7 ee ff 00 00 00 00	r7 = *(u16 *)(r10 - 18)
      39:	07 06 00 00 02 00 00 00	r6 += 2
      40:	bf a1 00 00 00 00 00 00	r1 = r10
      41:	07 01 00 00 fa ff ff ff	r1 += -6
      42:	b7 02 00 00 02 00 00 00	r2 = 2
      43:	bf 63 00 00 00 00 00 00	r3 = r6
      44:	85 00 00 00 04 00 00 00	call 4
      45:	63 0a dc ff 00 00 00 00	*(u32 *)(r10 - 36) = r0
      46:	bf 01 00 00 00 00 00 00	r1 = r0
      47:	67 01 00 00 20 00 00 00	r1 <<= 32
      48:	77 01 00 00 20 00 00 00	r1 >>= 32
      49:	15 01 03 00 00 00 00 00	if r1 == 0 goto +3 <LBB0_9>
      50:	05 00 dd ff 00 00 00 00	goto -35 <LBB0_2>

0000000000000198 <LBB0_8>:
      51:	b7 00 00 00 00 00 00 00	r0 = 0
      52:	95 00 00 00 00 00 00 00	exit

00000000000001a8 <LBB0_9>:
      53:	69 a1 fa ff 00 00 00 00	r1 = *(u16 *)(r10 - 6)
      54:	63 1a d4 ff 00 00 00 00	*(u32 *)(r10 - 44) = r1
      55:	18 01 00 00 fe ff ff ff 00 00 00 00 00 00 00 00	r1 = 4294967294 ll
      57:	63 1a dc ff 00 00 00 00	*(u32 *)(r10 - 36) = r1
      58:	18 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00	r1 = 0 ll
      60:	15 07 07 00 00 00 00 00	if r7 == 0 goto +7 <LBB0_14>
      61:	15 07 04 00 01 00 00 00	if r7 == 1 goto +4 <LBB0_13>
      62:	55 07 28 00 02 00 00 00	if r7 != 2 goto +40 <LBB0_22>
      63:	18 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00	r1 = 0 ll
      65:	05 00 02 00 00 00 00 00	goto +2 <LBB0_14>

0000000000000210 <LBB0_13>:
      66:	18 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00	r1 = 0 ll

0000000000000220 <LBB0_14>:
      68:	bf a2 00 00 00 00 00 00	r2 = r10
      69:	07 02 00 00 d4 ff ff ff	r2 += -44
      70:	85 00 00 00 01 00 00 00	call 1
      71:	bf 06 00 00 00 00 00 00	r6 = r0
      72:	55 06 02 00 00 00 00 00	if r6 != 0 goto +2 <LBB0_16>
      73:	b7 01 00 00 99 00 00 00	r1 = 153
      74:	05 00 1d 00 00 00 00 00	goto +29 <LBB0_23>

0000000000000258 <LBB0_16>:
      75:	61 a1 d4 ff 00 00 00 00	r1 = *(u32 *)(r10 - 44)
      76:	63 1a fc ff 00 00 00 00	*(u32 *)(r10 - 4) = r1
      77:	bf a2 00 00 00 00 00 00	r2 = r10
      78:	07 02 00 00 fc ff ff ff	r2 += -4
      79:	bf 61 00 00 00 00 00 00	r1 = r6
      80:	85 00 00 00 01 00 00 00	call 1
      81:	18 01 00 00 fe ff ff ff 00 00 00 00 00 00 00 00	r1 = 4294967294 ll
      83:	15 00 01 00 00 00 00 00	if r0 == 0 goto +1 <LBB0_18>
      84:	61 01 00 00 00 00 00 00	r1 = *(u32 *)(r0 + 0)

00000000000002a8 <LBB0_18>:
      85:	63 1a dc ff 00 00 00 00	*(u32 *)(r10 - 36) = r1
      86:	61 a1 d4 ff 00 00 00 00	r1 = *(u32 *)(r10 - 44)
      87:	25 07 13 00 01 00 00 00	if r7 > 1 goto +19 <LBB0_24>
      88:	63 1a fc ff 00 00 00 00	*(u32 *)(r10 - 4) = r1
      89:	18 01 00 00 ea ff ff ff 00 00 00 00 00 00 00 00	r1 = 4294967274 ll
      91:	18 02 00 00 00 00 00 00 00 00 00 00 00 00 00 00	r2 = 0 ll
      93:	5d 26 1c 00 00 00 00 00	if r6 != r2 goto +28 <LBB0_27>
      94:	bf a2 00 00 00 00 00 00	r2 = r10
      95:	07 02 00 00 fc ff ff ff	r2 += -4
      96:	18 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00	r1 = 0 ll
      98:	85 00 00 00 01 00 00 00	call 1
      99:	18 01 00 00 fe ff ff ff 00 00 00 00 00 00 00 00	r1 = 4294967294 ll
     101:	15 00 14 00 00 00 00 00	if r0 == 0 goto +20 <LBB0_27>
     102:	05 00 12 00 00 00 00 00	goto +18 <LBB0_26>

0000000000000338 <LBB0_22>:
     103:	b7 01 00 00 92 00 00 00	r1 = 146

0000000000000340 <LBB0_23>:
     104:	63 1a fc ff 00 00 00 00	*(u32 *)(r10 - 4) = r1
     105:	63 1a dc ff 00 00 00 00	*(u32 *)(r10 - 36) = r1
     106:	05 00 a6 ff 00 00 00 00	goto -90 <LBB0_3>

0000000000000358 <LBB0_24>:
     107:	63 1a fc ff 00 00 00 00	*(u32 *)(r10 - 4) = r1
     108:	18 01 00 00 ea ff ff ff 00 00 00 00 00 00 00 00	r1 = 4294967274 ll
     110:	18 02 00 00 00 00 00 00 00 00 00 00 00 00 00 00	r2 = 0 ll
     112:	5d 26 09 00 00 00 00 00	if r6 != r2 goto +9 <LBB0_27>
     113:	bf a2 00 00 00 00 00 00	r2 = r10
     114:	07 02 00 00 fc ff ff ff	r2 += -4
     115:	18 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00	r1 = 0 ll
     117:	85 00 00 00 01 00 00 00	call 1
     118:	18 01 00 00 fe ff ff ff 00 00 00 00 00 00 00 00	r1 = 4294967294 ll
     120:	15 00 01 00 00 00 00 00	if r0 == 0 goto +1 <LBB0_27>

00000000000003c8 <LBB0_26>:
     121:	61 01 00 00 00 00 00 00	r1 = *(u32 *)(r0 + 0)

00000000000003d0 <LBB0_27>:
     122:	63 1a fc ff 00 00 00 00	*(u32 *)(r10 - 4) = r1
     123:	05 00 95 ff 00 00 00 00	goto -107 <LBB0_3>
