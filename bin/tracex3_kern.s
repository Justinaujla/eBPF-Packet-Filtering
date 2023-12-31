
./ebpf-samples/all/tracex3_kern.o:	file format elf64-bpf

Disassembly of section kprobe/blk_start_request:

0000000000000000 <bpf_prog1>:
       0:	79 11 70 00 00 00 00 00	r1 = *(u64 *)(r1 + 112)
       1:	7b 1a f8 ff 00 00 00 00	*(u64 *)(r10 - 8) = r1
       2:	85 00 00 00 05 00 00 00	call 5
       3:	7b 0a f0 ff 00 00 00 00	*(u64 *)(r10 - 16) = r0
       4:	bf a2 00 00 00 00 00 00	r2 = r10
       5:	07 02 00 00 f8 ff ff ff	r2 += -8
       6:	bf a3 00 00 00 00 00 00	r3 = r10
       7:	07 03 00 00 f0 ff ff ff	r3 += -16
       8:	18 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00	r1 = 0 ll
      10:	b7 04 00 00 00 00 00 00	r4 = 0
      11:	85 00 00 00 02 00 00 00	call 2
      12:	b7 00 00 00 00 00 00 00	r0 = 0
      13:	95 00 00 00 00 00 00 00	exit

Disassembly of section kprobe/blk_account_io_completion:

0000000000000000 <bpf_prog2>:
       0:	79 11 70 00 00 00 00 00	r1 = *(u64 *)(r1 + 112)
       1:	7b 1a f8 ff 00 00 00 00	*(u64 *)(r10 - 8) = r1
       2:	bf a2 00 00 00 00 00 00	r2 = r10
       3:	07 02 00 00 f8 ff ff ff	r2 += -8
       4:	18 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00	r1 = 0 ll
       6:	85 00 00 00 01 00 00 00	call 1
       7:	bf 07 00 00 00 00 00 00	r7 = r0
       8:	15 07 58 00 00 00 00 00	if r7 == 0 goto +88 <LBB1_31>
       9:	85 00 00 00 05 00 00 00	call 5
      10:	bf 06 00 00 00 00 00 00	r6 = r0
      11:	79 77 00 00 00 00 00 00	r7 = *(u64 *)(r7 + 0)
      12:	bf a2 00 00 00 00 00 00	r2 = r10
      13:	07 02 00 00 f8 ff ff ff	r2 += -8
      14:	18 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00	r1 = 0 ll
      16:	85 00 00 00 03 00 00 00	call 3
      17:	1f 76 00 00 00 00 00 00	r6 -= r7
      18:	b7 01 00 00 01 00 00 00	r1 = 1
      19:	b7 03 00 00 01 00 00 00	r3 = 1
      20:	15 06 01 00 00 00 00 00	if r6 == 0 goto +1 <LBB1_3>
      21:	b7 03 00 00 00 00 00 00	r3 = 0

00000000000000b0 <LBB1_3>:
      22:	b7 02 00 00 20 00 00 00	r2 = 32
      23:	b7 04 00 00 ff ff ff ff	r4 = -1
      24:	15 06 01 00 00 00 00 00	if r6 == 0 goto +1 <LBB1_5>
      25:	b7 04 00 00 00 00 00 00	r4 = 0

00000000000000d0 <LBB1_5>:
      26:	1f 32 00 00 00 00 00 00	r2 -= r3
      27:	18 05 00 00 ff ff ff ff 00 00 00 00 00 00 00 00	r5 = 4294967295 ll
      29:	2d 56 01 00 00 00 00 00	if r6 > r5 goto +1 <LBB1_7>
      30:	bf 42 00 00 00 00 00 00	r2 = r4

00000000000000f8 <LBB1_7>:
      31:	bf 63 00 00 00 00 00 00	r3 = r6
      32:	77 03 00 00 20 00 00 00	r3 >>= 32
      33:	2d 56 01 00 00 00 00 00	if r6 > r5 goto +1 <LBB1_9>
      34:	bf 63 00 00 00 00 00 00	r3 = r6

0000000000000118 <LBB1_9>:
      35:	bf 24 00 00 00 00 00 00	r4 = r2
      36:	07 04 00 00 10 00 00 00	r4 += 16
      37:	25 03 01 00 ff ff 00 00	if r3 > 65535 goto +1 <LBB1_11>
      38:	bf 24 00 00 00 00 00 00	r4 = r2

0000000000000138 <LBB1_11>:
      39:	bf 32 00 00 00 00 00 00	r2 = r3
      40:	77 02 00 00 10 00 00 00	r2 >>= 16
      41:	25 03 01 00 ff ff 00 00	if r3 > 65535 goto +1 <LBB1_13>
      42:	bf 32 00 00 00 00 00 00	r2 = r3

0000000000000158 <LBB1_13>:
      43:	bf 43 00 00 00 00 00 00	r3 = r4
      44:	07 03 00 00 08 00 00 00	r3 += 8
      45:	25 02 01 00 ff 00 00 00	if r2 > 255 goto +1 <LBB1_15>
      46:	bf 43 00 00 00 00 00 00	r3 = r4

0000000000000178 <LBB1_15>:
      47:	bf 24 00 00 00 00 00 00	r4 = r2
      48:	77 04 00 00 08 00 00 00	r4 >>= 8
      49:	25 02 01 00 ff 00 00 00	if r2 > 255 goto +1 <LBB1_17>
      50:	bf 24 00 00 00 00 00 00	r4 = r2

0000000000000198 <LBB1_17>:
      51:	bf 35 00 00 00 00 00 00	r5 = r3
      52:	07 05 00 00 04 00 00 00	r5 += 4
      53:	25 04 01 00 0f 00 00 00	if r4 > 15 goto +1 <LBB1_19>
      54:	bf 35 00 00 00 00 00 00	r5 = r3

00000000000001b8 <LBB1_19>:
      55:	bf 43 00 00 00 00 00 00	r3 = r4
      56:	77 03 00 00 04 00 00 00	r3 >>= 4
      57:	25 04 01 00 0f 00 00 00	if r4 > 15 goto +1 <LBB1_21>
      58:	bf 43 00 00 00 00 00 00	r3 = r4

00000000000001d8 <LBB1_21>:
      59:	bf 52 00 00 00 00 00 00	r2 = r5
      60:	07 02 00 00 02 00 00 00	r2 += 2
      61:	25 03 01 00 03 00 00 00	if r3 > 3 goto +1 <LBB1_23>
      62:	bf 52 00 00 00 00 00 00	r2 = r5

00000000000001f8 <LBB1_23>:
      63:	bf 34 00 00 00 00 00 00	r4 = r3
      64:	77 04 00 00 02 00 00 00	r4 >>= 2
      65:	25 03 01 00 03 00 00 00	if r3 > 3 goto +1 <LBB1_25>
      66:	bf 34 00 00 00 00 00 00	r4 = r3

0000000000000218 <LBB1_25>:
      67:	b7 03 00 00 01 00 00 00	r3 = 1
      68:	25 04 01 00 01 00 00 00	if r4 > 1 goto +1 <LBB1_27>
      69:	b7 03 00 00 00 00 00 00	r3 = 0

0000000000000230 <LBB1_27>:
      70:	0f 32 00 00 00 00 00 00	r2 += r3
      71:	67 02 00 00 20 00 00 00	r2 <<= 32
      72:	77 02 00 00 20 00 00 00	r2 >>= 32
      73:	6f 21 00 00 00 00 00 00	r1 <<= r2
      74:	1f 16 00 00 00 00 00 00	r6 -= r1
      75:	67 06 00 00 06 00 00 00	r6 <<= 6
      76:	7f 26 00 00 00 00 00 00	r6 >>= r2
      77:	67 02 00 00 06 00 00 00	r2 <<= 6
      78:	0f 26 00 00 00 00 00 00	r6 += r2
      79:	27 06 00 00 03 00 00 00	r6 *= 3
      80:	77 06 00 00 06 00 00 00	r6 >>= 6
      81:	bf 61 00 00 00 00 00 00	r1 = r6
      82:	67 01 00 00 20 00 00 00	r1 <<= 32
      83:	77 01 00 00 20 00 00 00	r1 >>= 32
      84:	b7 02 00 00 63 00 00 00	r2 = 99
      85:	2d 12 01 00 00 00 00 00	if r2 > r1 goto +1 <LBB1_29>
      86:	b7 06 00 00 63 00 00 00	r6 = 99

00000000000002b8 <LBB1_29>:
      87:	63 6a f4 ff 00 00 00 00	*(u32 *)(r10 - 12) = r6
      88:	bf a2 00 00 00 00 00 00	r2 = r10
      89:	07 02 00 00 f4 ff ff ff	r2 += -12
      90:	18 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00	r1 = 0 ll
      92:	85 00 00 00 01 00 00 00	call 1
      93:	15 00 03 00 00 00 00 00	if r0 == 0 goto +3 <LBB1_31>
      94:	79 01 00 00 00 00 00 00	r1 = *(u64 *)(r0 + 0)
      95:	07 01 00 00 01 00 00 00	r1 += 1
      96:	7b 10 00 00 00 00 00 00	*(u64 *)(r0 + 0) = r1

0000000000000308 <LBB1_31>:
      97:	b7 00 00 00 00 00 00 00	r0 = 0
      98:	95 00 00 00 00 00 00 00	exit
