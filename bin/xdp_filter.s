
./ebpf-samples/all/xdp_filter.o:	file format elf64-bpf

Disassembly of section xdp:

0000000000000000 <xdp_hashfilter>:
       0:	b7 06 00 00 02 00 00 00	r6 = 2
       1:	61 19 04 00 00 00 00 00	r9 = *(u32 *)(r1 + 4)
       2:	61 17 00 00 00 00 00 00	r7 = *(u32 *)(r1 + 0)
       3:	bf 71 00 00 00 00 00 00	r1 = r7
       4:	07 01 00 00 0e 00 00 00	r1 += 14
       5:	2d 91 3e 01 00 00 00 00	if r1 > r9 goto +318 <LBB0_40>
       6:	71 71 0c 00 00 00 00 00	r1 = *(u8 *)(r7 + 12)
       7:	71 72 0d 00 00 00 00 00	r2 = *(u8 *)(r7 + 13)
       8:	67 02 00 00 08 00 00 00	r2 <<= 8
       9:	4f 12 00 00 00 00 00 00	r2 |= r1
      10:	15 02 02 00 88 a8 00 00	if r2 == 43144 goto +2 <LBB0_3>
      11:	b7 01 00 00 0e 00 00 00	r1 = 14
      12:	55 02 05 00 81 00 00 00	if r2 != 129 goto +5 <LBB0_5>

0000000000000068 <LBB0_3>:
      13:	bf 71 00 00 00 00 00 00	r1 = r7
      14:	07 01 00 00 12 00 00 00	r1 += 18
      15:	2d 91 34 01 00 00 00 00	if r1 > r9 goto +308 <LBB0_40>
      16:	b7 01 00 00 12 00 00 00	r1 = 18
      17:	69 72 10 00 00 00 00 00	r2 = *(u16 *)(r7 + 16)

0000000000000090 <LBB0_5>:
      18:	bf 23 00 00 00 00 00 00	r3 = r2
      19:	57 03 00 00 ff ff 00 00	r3 &= 65535
      20:	15 03 01 00 88 a8 00 00	if r3 == 43144 goto +1 <LBB0_7>
      21:	55 03 09 00 81 00 00 00	if r3 != 129 goto +9 <LBB0_9>

00000000000000b0 <LBB0_7>:
      22:	bf 13 00 00 00 00 00 00	r3 = r1
      23:	07 03 00 00 04 00 00 00	r3 += 4
      24:	bf 72 00 00 00 00 00 00	r2 = r7
      25:	0f 32 00 00 00 00 00 00	r2 += r3
      26:	2d 92 29 01 00 00 00 00	if r2 > r9 goto +297 <LBB0_40>
      27:	bf 72 00 00 00 00 00 00	r2 = r7
      28:	0f 12 00 00 00 00 00 00	r2 += r1
      29:	69 22 02 00 00 00 00 00	r2 = *(u16 *)(r2 + 2)
      30:	bf 31 00 00 00 00 00 00	r1 = r3

00000000000000f8 <LBB0_9>:
      31:	57 02 00 00 ff ff 00 00	r2 &= 65535
      32:	15 02 1e 00 86 dd 00 00	if r2 == 56710 goto +30 <LBB0_25>
      33:	55 02 22 01 08 00 00 00	if r2 != 8 goto +290 <LBB0_40>
      34:	b7 02 00 00 00 00 00 00	r2 = 0
      35:	63 2a d4 ff 00 00 00 00	*(u32 *)(r10 - 44) = r2
      36:	bf 78 00 00 00 00 00 00	r8 = r7
      37:	0f 18 00 00 00 00 00 00	r8 += r1
      38:	bf a2 00 00 00 00 00 00	r2 = r10
      39:	07 02 00 00 d4 ff ff ff	r2 += -44
      40:	18 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00	r1 = 0 ll
      42:	85 00 00 00 01 00 00 00	call 1
      43:	b7 06 00 00 02 00 00 00	r6 = 2
      44:	bf 81 00 00 00 00 00 00	r1 = r8
      45:	07 01 00 00 14 00 00 00	r1 += 20
      46:	2d 91 15 01 00 00 00 00	if r1 > r9 goto +277 <LBB0_40>
      47:	71 83 09 00 00 00 00 00	r3 = *(u8 *)(r8 + 9)
      48:	63 3a e4 ff 00 00 00 00	*(u32 *)(r10 - 28) = r3
      49:	61 82 0c 00 00 00 00 00	r2 = *(u32 *)(r8 + 12)
      50:	63 2a d8 ff 00 00 00 00	*(u32 *)(r10 - 40) = r2
      51:	61 82 10 00 00 00 00 00	r2 = *(u32 *)(r8 + 16)
      52:	63 2a dc ff 00 00 00 00	*(u32 *)(r10 - 36) = r2
      53:	15 03 21 00 11 00 00 00	if r3 == 17 goto +33 <LBB0_15>
      54:	b7 02 00 00 00 00 00 00	r2 = 0
      55:	b7 04 00 00 00 00 00 00	r4 = 0
      56:	55 03 23 00 06 00 00 00	if r3 != 6 goto +35 <LBB0_18>
      57:	bf 12 00 00 00 00 00 00	r2 = r1
      58:	07 02 00 00 14 00 00 00	r2 += 20
      59:	2d 92 08 01 00 00 00 00	if r2 > r9 goto +264 <LBB0_40>
      60:	69 12 00 00 00 00 00 00	r2 = *(u16 *)(r1 + 0)
      61:	69 14 02 00 00 00 00 00	r4 = *(u16 *)(r1 + 2)
      62:	05 00 1d 00 00 00 00 00	goto +29 <LBB0_18>

00000000000001f8 <LBB0_25>:
      63:	bf 78 00 00 00 00 00 00	r8 = r7
      64:	0f 18 00 00 00 00 00 00	r8 += r1
      65:	b7 01 00 00 00 00 00 00	r1 = 0
      66:	63 1a d4 ff 00 00 00 00	*(u32 *)(r10 - 44) = r1
      67:	bf a2 00 00 00 00 00 00	r2 = r10
      68:	07 02 00 00 d4 ff ff ff	r2 += -44
      69:	18 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00	r1 = 0 ll
      71:	85 00 00 00 01 00 00 00	call 1
      72:	bf 82 00 00 00 00 00 00	r2 = r8
      73:	07 02 00 00 28 00 00 00	r2 += 40
      74:	b7 06 00 00 00 00 00 00	r6 = 0
      75:	2d 92 f8 00 00 00 00 00	if r2 > r9 goto +248 <LBB0_40>
      76:	b7 06 00 00 02 00 00 00	r6 = 2
      77:	71 81 06 00 00 00 00 00	r1 = *(u8 *)(r8 + 6)
      78:	15 01 2e 00 11 00 00 00	if r1 == 17 goto +46 <LBB0_29>
      79:	55 01 f4 00 06 00 00 00	if r1 != 6 goto +244 <LBB0_40>
      80:	bf 23 00 00 00 00 00 00	r3 = r2
      81:	07 03 00 00 14 00 00 00	r3 += 20
      82:	2d 93 f1 00 00 00 00 00	if r3 > r9 goto +241 <LBB0_40>
      83:	7b 0a c8 ff 00 00 00 00	*(u64 *)(r10 - 56) = r0
      84:	69 23 00 00 00 00 00 00	r3 = *(u16 *)(r2 + 0)
      85:	69 22 02 00 00 00 00 00	r2 = *(u16 *)(r2 + 2)
      86:	05 00 2c 00 00 00 00 00	goto +44 <LBB0_32>

00000000000002b8 <LBB0_15>:
      87:	bf 12 00 00 00 00 00 00	r2 = r1
      88:	07 02 00 00 08 00 00 00	r2 += 8
      89:	2d 92 ea 00 00 00 00 00	if r2 > r9 goto +234 <LBB0_40>
      90:	69 14 02 00 00 00 00 00	r4 = *(u16 *)(r1 + 2)
      91:	bf 42 00 00 00 00 00 00	r2 = r4

00000000000002e0 <LBB0_18>:
      92:	7b 0a c8 ff 00 00 00 00	*(u64 *)(r10 - 56) = r0
      93:	6b 4a e2 ff 00 00 00 00	*(u16 *)(r10 - 30) = r4
      94:	6b 2a e0 ff 00 00 00 00	*(u16 *)(r10 - 32) = r2
      95:	bf a2 00 00 00 00 00 00	r2 = r10
      96:	07 02 00 00 d8 ff ff ff	r2 += -40
      97:	18 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00	r1 = 0 ll
      99:	85 00 00 00 01 00 00 00	call 1
     100:	15 00 4d 00 00 00 00 00	if r0 == 0 goto +77 <LBB0_21>
     101:	bf 06 00 00 00 00 00 00	r6 = r0
     102:	85 00 00 00 05 00 00 00	call 5
     103:	7b 06 00 00 00 00 00 00	*(u64 *)(r6 + 0) = r0
     104:	79 61 08 00 00 00 00 00	r1 = *(u64 *)(r6 + 8)
     105:	07 01 00 00 01 00 00 00	r1 += 1
     106:	7b 16 08 00 00 00 00 00	*(u64 *)(r6 + 8) = r1
     107:	1f 79 00 00 00 00 00 00	r9 -= r7
     108:	79 61 10 00 00 00 00 00	r1 = *(u64 *)(r6 + 16)
     109:	0f 19 00 00 00 00 00 00	r9 += r1
     110:	7b 96 10 00 00 00 00 00	*(u64 *)(r6 + 16) = r9
     111:	bf a2 00 00 00 00 00 00	r2 = r10
     112:	07 02 00 00 d4 ff ff ff	r2 += -44
     113:	18 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00	r1 = 0 ll
     115:	85 00 00 00 01 00 00 00	call 1
     116:	b7 06 00 00 01 00 00 00	r6 = 1
     117:	15 00 ce 00 00 00 00 00	if r0 == 0 goto +206 <LBB0_40>

00000000000003b0 <LBB0_20>:
     118:	18 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00	r1 = 0 ll
     120:	b7 02 00 00 00 00 00 00	r2 = 0

00000000000003c8 <LBB0_39>:
     121:	b7 03 00 00 00 00 00 00	r3 = 0
     122:	85 00 00 00 33 00 00 00	call 51
     123:	bf 06 00 00 00 00 00 00	r6 = r0
     124:	05 00 c7 00 00 00 00 00	goto +199 <LBB0_40>

00000000000003e8 <LBB0_29>:
     125:	bf 23 00 00 00 00 00 00	r3 = r2
     126:	07 03 00 00 08 00 00 00	r3 += 8
     127:	2d 93 c4 00 00 00 00 00	if r3 > r9 goto +196 <LBB0_40>
     128:	7b 0a c8 ff 00 00 00 00	*(u64 *)(r10 - 56) = r0
     129:	69 22 02 00 00 00 00 00	r2 = *(u16 *)(r2 + 2)
     130:	bf 23 00 00 00 00 00 00	r3 = r2

0000000000000418 <LBB0_32>:
     131:	63 1a fc ff 00 00 00 00	*(u32 *)(r10 - 4) = r1
     132:	61 81 14 00 00 00 00 00	r1 = *(u32 *)(r8 + 20)
     133:	67 01 00 00 20 00 00 00	r1 <<= 32
     134:	61 84 10 00 00 00 00 00	r4 = *(u32 *)(r8 + 16)
     135:	4f 41 00 00 00 00 00 00	r1 |= r4
     136:	7b 1a e0 ff 00 00 00 00	*(u64 *)(r10 - 32) = r1
     137:	61 81 0c 00 00 00 00 00	r1 = *(u32 *)(r8 + 12)
     138:	67 01 00 00 20 00 00 00	r1 <<= 32
     139:	61 84 08 00 00 00 00 00	r4 = *(u32 *)(r8 + 8)
     140:	4f 41 00 00 00 00 00 00	r1 |= r4
     141:	7b 1a d8 ff 00 00 00 00	*(u64 *)(r10 - 40) = r1
     142:	61 81 20 00 00 00 00 00	r1 = *(u32 *)(r8 + 32)
     143:	61 84 24 00 00 00 00 00	r4 = *(u32 *)(r8 + 36)
     144:	61 85 18 00 00 00 00 00	r5 = *(u32 *)(r8 + 24)
     145:	61 80 1c 00 00 00 00 00	r0 = *(u32 *)(r8 + 28)
     146:	6b 3a f8 ff 00 00 00 00	*(u16 *)(r10 - 8) = r3
     147:	6b 2a fa ff 00 00 00 00	*(u16 *)(r10 - 6) = r2
     148:	67 00 00 00 20 00 00 00	r0 <<= 32
     149:	4f 50 00 00 00 00 00 00	r0 |= r5
     150:	67 04 00 00 20 00 00 00	r4 <<= 32
     151:	4f 14 00 00 00 00 00 00	r4 |= r1
     152:	7b 4a f0 ff 00 00 00 00	*(u64 *)(r10 - 16) = r4
     153:	7b 0a e8 ff 00 00 00 00	*(u64 *)(r10 - 24) = r0
     154:	bf a2 00 00 00 00 00 00	r2 = r10
     155:	07 02 00 00 d8 ff ff ff	r2 += -40
     156:	18 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00	r1 = 0 ll
     158:	85 00 00 00 01 00 00 00	call 1
     159:	15 00 54 00 00 00 00 00	if r0 == 0 goto +84 <LBB0_35>
     160:	79 01 08 00 00 00 00 00	r1 = *(u64 *)(r0 + 8)
     161:	07 01 00 00 01 00 00 00	r1 += 1
     162:	7b 10 08 00 00 00 00 00	*(u64 *)(r0 + 8) = r1
     163:	1f 79 00 00 00 00 00 00	r9 -= r7
     164:	79 01 10 00 00 00 00 00	r1 = *(u64 *)(r0 + 16)
     165:	0f 19 00 00 00 00 00 00	r9 += r1
     166:	7b 90 10 00 00 00 00 00	*(u64 *)(r0 + 16) = r9
     167:	bf 06 00 00 00 00 00 00	r6 = r0
     168:	85 00 00 00 05 00 00 00	call 5
     169:	7b 06 00 00 00 00 00 00	*(u64 *)(r6 + 0) = r0
     170:	bf a2 00 00 00 00 00 00	r2 = r10
     171:	07 02 00 00 d4 ff ff ff	r2 += -44
     172:	18 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00	r1 = 0 ll
     174:	85 00 00 00 01 00 00 00	call 1
     175:	b7 06 00 00 01 00 00 00	r6 = 1
     176:	15 00 93 00 00 00 00 00	if r0 == 0 goto +147 <LBB0_40>
     177:	05 00 c4 ff 00 00 00 00	goto -60 <LBB0_20>

0000000000000590 <LBB0_21>:
     178:	79 a1 c8 ff 00 00 00 00	r1 = *(u64 *)(r10 - 56)
     179:	15 01 90 00 00 00 00 00	if r1 == 0 goto +144 <LBB0_40>
     180:	61 11 00 00 00 00 00 00	r1 = *(u32 *)(r1 + 0)
     181:	15 01 8e 00 00 00 00 00	if r1 == 0 goto +142 <LBB0_40>
     182:	61 a2 d8 ff 00 00 00 00	r2 = *(u32 *)(r10 - 40)
     183:	61 a3 dc ff 00 00 00 00	r3 = *(u32 *)(r10 - 36)
     184:	0f 23 00 00 00 00 00 00	r3 += r2
     185:	71 82 09 00 00 00 00 00	r2 = *(u8 *)(r8 + 9)
     186:	bf 34 00 00 00 00 00 00	r4 = r3
     187:	57 04 00 00 ff ff 00 00	r4 &= 65535
     188:	0f 42 00 00 00 00 00 00	r2 += r4
     189:	77 03 00 00 05 00 00 00	r3 >>= 5
     190:	57 03 00 00 00 f8 ff 07	r3 &= 134215680
     191:	07 02 00 00 a7 4b ec 00	r2 += 15485863
     192:	bf 24 00 00 00 00 00 00	r4 = r2
     193:	af 34 00 00 00 00 00 00	r4 ^= r3
     194:	67 02 00 00 10 00 00 00	r2 <<= 16
     195:	af 24 00 00 00 00 00 00	r4 ^= r2
     196:	18 02 00 00 00 f8 ff ff 00 00 00 00 00 00 00 00	r2 = 4294965248 ll
     198:	bf 43 00 00 00 00 00 00	r3 = r4
     199:	5f 23 00 00 00 00 00 00	r3 &= r2
     200:	77 03 00 00 0b 00 00 00	r3 >>= 11
     201:	0f 43 00 00 00 00 00 00	r3 += r4
     202:	bf 32 00 00 00 00 00 00	r2 = r3
     203:	67 02 00 00 03 00 00 00	r2 <<= 3
     204:	af 32 00 00 00 00 00 00	r2 ^= r3
     205:	18 03 00 00 e0 ff ff ff 00 00 00 00 00 00 00 00	r3 = 4294967264 ll
     207:	bf 24 00 00 00 00 00 00	r4 = r2
     208:	5f 34 00 00 00 00 00 00	r4 &= r3
     209:	77 04 00 00 05 00 00 00	r4 >>= 5
     210:	0f 24 00 00 00 00 00 00	r4 += r2
     211:	bf 42 00 00 00 00 00 00	r2 = r4
     212:	67 02 00 00 04 00 00 00	r2 <<= 4
     213:	af 42 00 00 00 00 00 00	r2 ^= r4
     214:	18 03 00 00 00 00 fe ff 00 00 00 00 00 00 00 00	r3 = 4294836224 ll
     216:	bf 24 00 00 00 00 00 00	r4 = r2
     217:	5f 34 00 00 00 00 00 00	r4 &= r3
     218:	77 04 00 00 11 00 00 00	r4 >>= 17
     219:	0f 24 00 00 00 00 00 00	r4 += r2
     220:	bf 42 00 00 00 00 00 00	r2 = r4
     221:	67 02 00 00 19 00 00 00	r2 <<= 25
     222:	af 42 00 00 00 00 00 00	r2 ^= r4
     223:	18 03 00 00 c0 ff ff ff 00 00 00 00 00 00 00 00	r3 = 4294967232 ll
     225:	bf 24 00 00 00 00 00 00	r4 = r2
     226:	5f 34 00 00 00 00 00 00	r4 &= r3
     227:	77 04 00 00 06 00 00 00	r4 >>= 6
     228:	0f 24 00 00 00 00 00 00	r4 += r2
     229:	67 04 00 00 20 00 00 00	r4 <<= 32
     230:	77 04 00 00 20 00 00 00	r4 >>= 32
     231:	bf 42 00 00 00 00 00 00	r2 = r4
     232:	3f 12 00 00 00 00 00 00	r2 /= r1
     233:	2f 12 00 00 00 00 00 00	r2 *= r1
     234:	1f 24 00 00 00 00 00 00	r4 -= r2
     235:	63 4a d0 ff 00 00 00 00	*(u32 *)(r10 - 48) = r4
     236:	bf a2 00 00 00 00 00 00	r2 = r10
     237:	07 02 00 00 d0 ff ff ff	r2 += -48
     238:	18 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00	r1 = 0 ll
     240:	85 00 00 00 01 00 00 00	call 1
     241:	b7 06 00 00 00 00 00 00	r6 = 0
     242:	15 00 51 00 00 00 00 00	if r0 == 0 goto +81 <LBB0_40>
     243:	05 00 4b 00 00 00 00 00	goto +75 <LBB0_38>

00000000000007a0 <LBB0_35>:
     244:	79 a1 c8 ff 00 00 00 00	r1 = *(u64 *)(r10 - 56)
     245:	15 01 4e 00 00 00 00 00	if r1 == 0 goto +78 <LBB0_40>
     246:	61 11 00 00 00 00 00 00	r1 = *(u32 *)(r1 + 0)
     247:	15 01 4c 00 00 00 00 00	if r1 == 0 goto +76 <LBB0_40>
     248:	61 a3 d8 ff 00 00 00 00	r3 = *(u32 *)(r10 - 40)
     249:	61 a2 e8 ff 00 00 00 00	r2 = *(u32 *)(r10 - 24)
     250:	0f 32 00 00 00 00 00 00	r2 += r3
     251:	61 a3 dc ff 00 00 00 00	r3 = *(u32 *)(r10 - 36)
     252:	0f 32 00 00 00 00 00 00	r2 += r3
     253:	61 a3 ec ff 00 00 00 00	r3 = *(u32 *)(r10 - 20)
     254:	0f 32 00 00 00 00 00 00	r2 += r3
     255:	61 a3 e0 ff 00 00 00 00	r3 = *(u32 *)(r10 - 32)
     256:	0f 32 00 00 00 00 00 00	r2 += r3
     257:	61 a3 f0 ff 00 00 00 00	r3 = *(u32 *)(r10 - 16)
     258:	0f 32 00 00 00 00 00 00	r2 += r3
     259:	61 a3 e4 ff 00 00 00 00	r3 = *(u32 *)(r10 - 28)
     260:	0f 32 00 00 00 00 00 00	r2 += r3
     261:	61 a3 f4 ff 00 00 00 00	r3 = *(u32 *)(r10 - 12)
     262:	0f 32 00 00 00 00 00 00	r2 += r3
     263:	71 83 06 00 00 00 00 00	r3 = *(u8 *)(r8 + 6)
     264:	bf 24 00 00 00 00 00 00	r4 = r2
     265:	57 04 00 00 ff ff 00 00	r4 &= 65535
     266:	0f 34 00 00 00 00 00 00	r4 += r3
     267:	77 02 00 00 05 00 00 00	r2 >>= 5
     268:	57 02 00 00 00 f8 ff 07	r2 &= 134215680
     269:	af 42 00 00 00 00 00 00	r2 ^= r4
     270:	67 04 00 00 10 00 00 00	r4 <<= 16
     271:	af 42 00 00 00 00 00 00	r2 ^= r4
     272:	18 03 00 00 00 f8 ff ff 00 00 00 00 00 00 00 00	r3 = 4294965248 ll
     274:	bf 24 00 00 00 00 00 00	r4 = r2
     275:	5f 34 00 00 00 00 00 00	r4 &= r3
     276:	77 04 00 00 0b 00 00 00	r4 >>= 11
     277:	0f 24 00 00 00 00 00 00	r4 += r2
     278:	bf 42 00 00 00 00 00 00	r2 = r4
     279:	67 02 00 00 03 00 00 00	r2 <<= 3
     280:	af 42 00 00 00 00 00 00	r2 ^= r4
     281:	18 03 00 00 e0 ff ff ff 00 00 00 00 00 00 00 00	r3 = 4294967264 ll
     283:	bf 24 00 00 00 00 00 00	r4 = r2
     284:	5f 34 00 00 00 00 00 00	r4 &= r3
     285:	77 04 00 00 05 00 00 00	r4 >>= 5
     286:	0f 24 00 00 00 00 00 00	r4 += r2
     287:	bf 42 00 00 00 00 00 00	r2 = r4
     288:	67 02 00 00 04 00 00 00	r2 <<= 4
     289:	af 42 00 00 00 00 00 00	r2 ^= r4
     290:	18 03 00 00 00 00 fe ff 00 00 00 00 00 00 00 00	r3 = 4294836224 ll
     292:	bf 24 00 00 00 00 00 00	r4 = r2
     293:	5f 34 00 00 00 00 00 00	r4 &= r3
     294:	77 04 00 00 11 00 00 00	r4 >>= 17
     295:	0f 24 00 00 00 00 00 00	r4 += r2
     296:	bf 42 00 00 00 00 00 00	r2 = r4
     297:	67 02 00 00 19 00 00 00	r2 <<= 25
     298:	af 42 00 00 00 00 00 00	r2 ^= r4
     299:	18 03 00 00 c0 ff ff ff 00 00 00 00 00 00 00 00	r3 = 4294967232 ll
     301:	bf 24 00 00 00 00 00 00	r4 = r2
     302:	5f 34 00 00 00 00 00 00	r4 &= r3
     303:	77 04 00 00 06 00 00 00	r4 >>= 6
     304:	0f 24 00 00 00 00 00 00	r4 += r2
     305:	67 04 00 00 20 00 00 00	r4 <<= 32
     306:	77 04 00 00 20 00 00 00	r4 >>= 32
     307:	bf 42 00 00 00 00 00 00	r2 = r4
     308:	3f 12 00 00 00 00 00 00	r2 /= r1
     309:	2f 12 00 00 00 00 00 00	r2 *= r1
     310:	1f 24 00 00 00 00 00 00	r4 -= r2
     311:	63 4a d0 ff 00 00 00 00	*(u32 *)(r10 - 48) = r4
     312:	bf a2 00 00 00 00 00 00	r2 = r10
     313:	07 02 00 00 d0 ff ff ff	r2 += -48
     314:	18 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00	r1 = 0 ll
     316:	85 00 00 00 01 00 00 00	call 1
     317:	b7 06 00 00 00 00 00 00	r6 = 0
     318:	15 00 05 00 00 00 00 00	if r0 == 0 goto +5 <LBB0_40>

00000000000009f8 <LBB0_38>:
     319:	61 02 00 00 00 00 00 00	r2 = *(u32 *)(r0 + 0)
     320:	63 2a d0 ff 00 00 00 00	*(u32 *)(r10 - 48) = r2
     321:	18 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00	r1 = 0 ll
     323:	05 00 35 ff 00 00 00 00	goto -203 <LBB0_39>

0000000000000a20 <LBB0_40>:
     324:	bf 60 00 00 00 00 00 00	r0 = r6
     325:	95 00 00 00 00 00 00 00	exit