
./ebpf-samples/all/packet_access.o:	file format elf64-bpf

Disassembly of section xdp:

0000000000000000 <test_packet_access>:
       0:	bf 16 00 00 00 00 00 00	r6 = r1
       1:	85 00 00 00 07 00 00 00	call 7
       2:	bf 01 00 00 00 00 00 00	r1 = r0
       3:	57 01 00 00 01 00 00 00	r1 &= 1
       4:	15 01 0b 00 00 00 00 00	if r1 == 0 goto +11 <LBB0_3>
       5:	67 00 00 00 02 00 00 00	r0 <<= 2
       6:	57 00 00 00 3c 00 00 00	r0 &= 60
       7:	61 61 00 00 00 00 00 00	r1 = *(u32 *)(r6 + 0)
       8:	0f 01 00 00 00 00 00 00	r1 += r0
       9:	b7 00 00 00 01 00 00 00	r0 = 1
      10:	bf 12 00 00 00 00 00 00	r2 = r1
      11:	07 02 00 00 04 00 00 00	r2 += 4
      12:	61 63 04 00 00 00 00 00	r3 = *(u32 *)(r6 + 4)
      13:	2d 32 0d 00 00 00 00 00	if r2 > r3 goto +13 <LBB0_4>
      14:	61 10 00 00 00 00 00 00	r0 = *(u32 *)(r1 + 0)
      15:	05 00 0b 00 00 00 00 00	goto +11 <LBB0_4>

0000000000000080 <LBB0_3>:
      16:	67 00 00 00 02 00 00 00	r0 <<= 2
      17:	57 00 00 00 3c 00 00 00	r0 &= 60
      18:	61 61 00 00 00 00 00 00	r1 = *(u32 *)(r6 + 0)
      19:	0f 10 00 00 00 00 00 00	r0 += r1
      20:	bf 01 00 00 00 00 00 00	r1 = r0
      21:	b7 00 00 00 01 00 00 00	r0 = 1
      22:	bf 12 00 00 00 00 00 00	r2 = r1
      23:	07 02 00 00 04 00 00 00	r2 += 4
      24:	61 63 04 00 00 00 00 00	r3 = *(u32 *)(r6 + 4)
      25:	2d 32 01 00 00 00 00 00	if r2 > r3 goto +1 <LBB0_4>
      26:	61 10 00 00 00 00 00 00	r0 = *(u32 *)(r1 + 0)

00000000000000d8 <LBB0_4>:
      27:	95 00 00 00 00 00 00 00	exit
