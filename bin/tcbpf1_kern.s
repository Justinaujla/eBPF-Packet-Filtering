
./ebpf-samples/all/tcbpf1_kern.o:	file format elf64-bpf

Disassembly of section classifier:

0000000000000000 <bpf_prog1>:
       0:	bf 16 00 00 00 00 00 00	r6 = r1
       1:	30 00 00 00 17 00 00 00	r0 = *(u8 *)skb[23]
       2:	57 00 00 00 ff 00 00 00	r0 &= 255
       3:	55 00 3b 00 06 00 00 00	if r0 != 6 goto +59 <LBB0_2>
       4:	b7 01 00 00 08 00 00 00	r1 = 8
       5:	73 1a f7 ff 00 00 00 00	*(u8 *)(r10 - 9) = r1
       6:	30 00 00 00 0f 00 00 00	r0 = *(u8 *)skb[15]
       7:	57 00 00 00 ff 00 00 00	r0 &= 255
       8:	dc 00 00 00 10 00 00 00	r0 = be16 r0
       9:	bf 61 00 00 00 00 00 00	r1 = r6
      10:	b7 02 00 00 18 00 00 00	r2 = 24
      11:	bf 03 00 00 00 00 00 00	r3 = r0
      12:	b7 04 00 00 00 08 00 00	r4 = 2048
      13:	b7 05 00 00 02 00 00 00	r5 = 2
      14:	85 00 00 00 0a 00 00 00	call 10
      15:	bf a3 00 00 00 00 00 00	r3 = r10
      16:	07 03 00 00 f7 ff ff ff	r3 += -9
      17:	bf 61 00 00 00 00 00 00	r1 = r6
      18:	b7 02 00 00 0f 00 00 00	r2 = 15
      19:	b7 04 00 00 01 00 00 00	r4 = 1
      20:	b7 05 00 00 00 00 00 00	r5 = 0
      21:	85 00 00 00 09 00 00 00	call 9
      22:	b7 01 00 00 01 01 01 0a	r1 = 167837953
      23:	63 1a f8 ff 00 00 00 00	*(u32 *)(r10 - 8) = r1
      24:	20 00 00 00 1a 00 00 00	r0 = *(u32 *)skb[26]
      25:	bf 07 00 00 00 00 00 00	r7 = r0
      26:	dc 07 00 00 20 00 00 00	r7 = be32 r7
      27:	bf 61 00 00 00 00 00 00	r1 = r6
      28:	b7 02 00 00 32 00 00 00	r2 = 50
      29:	bf 73 00 00 00 00 00 00	r3 = r7
      30:	b7 04 00 00 01 01 01 0a	r4 = 167837953
      31:	b7 05 00 00 14 00 00 00	r5 = 20
      32:	85 00 00 00 0b 00 00 00	call 11
      33:	bf 61 00 00 00 00 00 00	r1 = r6
      34:	b7 02 00 00 18 00 00 00	r2 = 24
      35:	bf 73 00 00 00 00 00 00	r3 = r7
      36:	b7 04 00 00 01 01 01 0a	r4 = 167837953
      37:	b7 05 00 00 04 00 00 00	r5 = 4
      38:	85 00 00 00 0a 00 00 00	call 10
      39:	bf a3 00 00 00 00 00 00	r3 = r10
      40:	07 03 00 00 f8 ff ff ff	r3 += -8
      41:	bf 61 00 00 00 00 00 00	r1 = r6
      42:	b7 02 00 00 1a 00 00 00	r2 = 26
      43:	b7 04 00 00 04 00 00 00	r4 = 4
      44:	b7 05 00 00 00 00 00 00	r5 = 0
      45:	85 00 00 00 09 00 00 00	call 9
      46:	b7 01 00 00 89 13 00 00	r1 = 5001
      47:	6b 1a fe ff 00 00 00 00	*(u16 *)(r10 - 2) = r1
      48:	28 00 00 00 24 00 00 00	r0 = *(u16 *)skb[36]
      49:	dc 00 00 00 10 00 00 00	r0 = be16 r0
      50:	bf 61 00 00 00 00 00 00	r1 = r6
      51:	b7 02 00 00 32 00 00 00	r2 = 50
      52:	bf 03 00 00 00 00 00 00	r3 = r0
      53:	b7 04 00 00 89 13 00 00	r4 = 5001
      54:	b7 05 00 00 02 00 00 00	r5 = 2
      55:	85 00 00 00 0b 00 00 00	call 11
      56:	bf a3 00 00 00 00 00 00	r3 = r10
      57:	07 03 00 00 fe ff ff ff	r3 += -2
      58:	bf 61 00 00 00 00 00 00	r1 = r6
      59:	b7 02 00 00 24 00 00 00	r2 = 36
      60:	b7 04 00 00 02 00 00 00	r4 = 2
      61:	b7 05 00 00 00 00 00 00	r5 = 0
      62:	85 00 00 00 09 00 00 00	call 9

00000000000001f8 <LBB0_2>:
      63:	b7 00 00 00 00 00 00 00	r0 = 0
      64:	95 00 00 00 00 00 00 00	exit

Disassembly of section redirect_xmit:

0000000000000000 <_redirect_xmit>:
       0:	61 11 28 00 00 00 00 00	r1 = *(u32 *)(r1 + 40)
       1:	07 01 00 00 01 00 00 00	r1 += 1
       2:	b7 02 00 00 00 00 00 00	r2 = 0
       3:	85 00 00 00 17 00 00 00	call 23
       4:	95 00 00 00 00 00 00 00	exit

Disassembly of section redirect_recv:

0000000000000000 <_redirect_recv>:
       0:	61 11 28 00 00 00 00 00	r1 = *(u32 *)(r1 + 40)
       1:	07 01 00 00 01 00 00 00	r1 += 1
       2:	b7 02 00 00 01 00 00 00	r2 = 1
       3:	85 00 00 00 17 00 00 00	call 23
       4:	95 00 00 00 00 00 00 00	exit

Disassembly of section clone_redirect_xmit:

0000000000000000 <_clone_redirect_xmit>:
       0:	61 12 28 00 00 00 00 00	r2 = *(u32 *)(r1 + 40)
       1:	07 02 00 00 01 00 00 00	r2 += 1
       2:	b7 03 00 00 00 00 00 00	r3 = 0
       3:	85 00 00 00 0d 00 00 00	call 13
       4:	b7 00 00 00 02 00 00 00	r0 = 2
       5:	95 00 00 00 00 00 00 00	exit

Disassembly of section clone_redirect_recv:

0000000000000000 <_clone_redirect_recv>:
       0:	61 12 28 00 00 00 00 00	r2 = *(u32 *)(r1 + 40)
       1:	07 02 00 00 01 00 00 00	r2 += 1
       2:	b7 03 00 00 01 00 00 00	r3 = 1
       3:	85 00 00 00 0d 00 00 00	call 13
       4:	b7 00 00 00 02 00 00 00	r0 = 2
       5:	95 00 00 00 00 00 00 00	exit
