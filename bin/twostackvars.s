
./ebpf-samples/all/twostackvars.o:	file format elf64-bpf

Disassembly of section .text:

0000000000000000 <func>:
       0:	85 00 00 00 07 00 00 00	call 7
       1:	bf 06 00 00 00 00 00 00	r6 = r0
       2:	bf 61 00 00 00 00 00 00	r1 = r6
       3:	57 01 00 00 01 00 00 00	r1 &= 1
       4:	15 01 1d 00 00 00 00 00	if r1 == 0 goto +29 <LBB0_2>
       5:	85 00 00 00 07 00 00 00	call 7
       6:	63 0a c0 ff 00 00 00 00	*(u32 *)(r10 - 64) = r0
       7:	85 00 00 00 07 00 00 00	call 7
       8:	63 0a c4 ff 00 00 00 00	*(u32 *)(r10 - 60) = r0
       9:	85 00 00 00 07 00 00 00	call 7
      10:	63 0a c8 ff 00 00 00 00	*(u32 *)(r10 - 56) = r0
      11:	57 06 00 00 07 00 00 00	r6 &= 7
      12:	bf 61 00 00 00 00 00 00	r1 = r6
      13:	67 01 00 00 02 00 00 00	r1 <<= 2
      14:	bf a7 00 00 00 00 00 00	r7 = r10
      15:	07 07 00 00 c0 ff ff ff	r7 += -64
      16:	0f 17 00 00 00 00 00 00	r7 += r1
      17:	85 00 00 00 07 00 00 00	call 7
      18:	63 0a cc ff 00 00 00 00	*(u32 *)(r10 - 52) = r0
      19:	85 00 00 00 07 00 00 00	call 7
      20:	63 0a d0 ff 00 00 00 00	*(u32 *)(r10 - 48) = r0
      21:	85 00 00 00 07 00 00 00	call 7
      22:	63 0a d4 ff 00 00 00 00	*(u32 *)(r10 - 44) = r0
      23:	85 00 00 00 07 00 00 00	call 7
      24:	63 0a d8 ff 00 00 00 00	*(u32 *)(r10 - 40) = r0
      25:	85 00 00 00 07 00 00 00	call 7
      26:	63 0a dc ff 00 00 00 00	*(u32 *)(r10 - 36) = r0
      27:	a7 06 00 00 01 00 00 00	r6 ^= 1
      28:	67 06 00 00 02 00 00 00	r6 <<= 2
      29:	bf 71 00 00 00 00 00 00	r1 = r7
      30:	0f 61 00 00 00 00 00 00	r1 += r6
      31:	b7 02 00 00 00 00 00 00	r2 = 0
      32:	63 21 00 00 00 00 00 00	*(u32 *)(r1 + 0) = r2
      33:	05 00 15 00 00 00 00 00	goto +21 <LBB0_3>

0000000000000110 <LBB0_2>:
      34:	85 00 00 00 07 00 00 00	call 7
      35:	63 0a e0 ff 00 00 00 00	*(u32 *)(r10 - 32) = r0
      36:	85 00 00 00 07 00 00 00	call 7
      37:	63 0a e4 ff 00 00 00 00	*(u32 *)(r10 - 28) = r0
      38:	85 00 00 00 07 00 00 00	call 7
      39:	63 0a e8 ff 00 00 00 00	*(u32 *)(r10 - 24) = r0
      40:	57 06 00 00 07 00 00 00	r6 &= 7
      41:	67 06 00 00 02 00 00 00	r6 <<= 2
      42:	bf a7 00 00 00 00 00 00	r7 = r10
      43:	07 07 00 00 e0 ff ff ff	r7 += -32
      44:	0f 67 00 00 00 00 00 00	r7 += r6
      45:	85 00 00 00 07 00 00 00	call 7
      46:	63 0a ec ff 00 00 00 00	*(u32 *)(r10 - 20) = r0
      47:	85 00 00 00 07 00 00 00	call 7
      48:	63 0a f0 ff 00 00 00 00	*(u32 *)(r10 - 16) = r0
      49:	85 00 00 00 07 00 00 00	call 7
      50:	63 0a f4 ff 00 00 00 00	*(u32 *)(r10 - 12) = r0
      51:	85 00 00 00 07 00 00 00	call 7
      52:	63 0a f8 ff 00 00 00 00	*(u32 *)(r10 - 8) = r0
      53:	85 00 00 00 07 00 00 00	call 7
      54:	63 0a fc ff 00 00 00 00	*(u32 *)(r10 - 4) = r0

00000000000001b8 <LBB0_3>:
      55:	61 70 00 00 00 00 00 00	r0 = *(u32 *)(r7 + 0)
      56:	95 00 00 00 00 00 00 00	exit
