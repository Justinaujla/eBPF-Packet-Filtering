
./ebpf-samples/all/xdp_monitor_kern.o:	file format elf64-bpf

Disassembly of section tracepoint/xdp/xdp_redirect_err:

0000000000000000 <trace_xdp_redirect_err>:
       0:	61 12 14 00 00 00 00 00	r2 = *(u32 *)(r1 + 20)
       1:	b7 06 00 00 01 00 00 00	r6 = 1
       2:	b7 01 00 00 01 00 00 00	r1 = 1
       3:	55 02 01 00 00 00 00 00	if r2 != 0 goto +1 <LBB0_2>
       4:	b7 01 00 00 00 00 00 00	r1 = 0

0000000000000028 <LBB0_2>:
       5:	63 1a fc ff 00 00 00 00	*(u32 *)(r10 - 4) = r1
       6:	bf a2 00 00 00 00 00 00	r2 = r10
       7:	07 02 00 00 fc ff ff ff	r2 += -4
       8:	18 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00	r1 = 0 ll
      10:	85 00 00 00 01 00 00 00	call 1
      11:	15 00 04 00 00 00 00 00	if r0 == 0 goto +4 <LBB0_4>
      12:	79 01 00 00 00 00 00 00	r1 = *(u64 *)(r0 + 0)
      13:	07 01 00 00 01 00 00 00	r1 += 1
      14:	7b 10 00 00 00 00 00 00	*(u64 *)(r0 + 0) = r1
      15:	b7 06 00 00 00 00 00 00	r6 = 0

0000000000000080 <LBB0_4>:
      16:	bf 60 00 00 00 00 00 00	r0 = r6
      17:	95 00 00 00 00 00 00 00	exit

Disassembly of section tracepoint/xdp/xdp_redirect_map_err:

0000000000000000 <trace_xdp_redirect_map_err>:
       0:	61 12 14 00 00 00 00 00	r2 = *(u32 *)(r1 + 20)
       1:	b7 06 00 00 01 00 00 00	r6 = 1
       2:	b7 01 00 00 01 00 00 00	r1 = 1
       3:	55 02 01 00 00 00 00 00	if r2 != 0 goto +1 <LBB1_2>
       4:	b7 01 00 00 00 00 00 00	r1 = 0

0000000000000028 <LBB1_2>:
       5:	63 1a fc ff 00 00 00 00	*(u32 *)(r10 - 4) = r1
       6:	bf a2 00 00 00 00 00 00	r2 = r10
       7:	07 02 00 00 fc ff ff ff	r2 += -4
       8:	18 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00	r1 = 0 ll
      10:	85 00 00 00 01 00 00 00	call 1
      11:	15 00 04 00 00 00 00 00	if r0 == 0 goto +4 <LBB1_4>
      12:	79 01 00 00 00 00 00 00	r1 = *(u64 *)(r0 + 0)
      13:	07 01 00 00 01 00 00 00	r1 += 1
      14:	7b 10 00 00 00 00 00 00	*(u64 *)(r0 + 0) = r1
      15:	b7 06 00 00 00 00 00 00	r6 = 0

0000000000000080 <LBB1_4>:
      16:	bf 60 00 00 00 00 00 00	r0 = r6
      17:	95 00 00 00 00 00 00 00	exit

Disassembly of section tracepoint/xdp/xdp_redirect:

0000000000000000 <trace_xdp_redirect>:
       0:	61 12 14 00 00 00 00 00	r2 = *(u32 *)(r1 + 20)
       1:	b7 06 00 00 01 00 00 00	r6 = 1
       2:	b7 01 00 00 01 00 00 00	r1 = 1
       3:	55 02 01 00 00 00 00 00	if r2 != 0 goto +1 <LBB2_2>
       4:	b7 01 00 00 00 00 00 00	r1 = 0

0000000000000028 <LBB2_2>:
       5:	63 1a fc ff 00 00 00 00	*(u32 *)(r10 - 4) = r1
       6:	bf a2 00 00 00 00 00 00	r2 = r10
       7:	07 02 00 00 fc ff ff ff	r2 += -4
       8:	18 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00	r1 = 0 ll
      10:	85 00 00 00 01 00 00 00	call 1
      11:	15 00 04 00 00 00 00 00	if r0 == 0 goto +4 <LBB2_4>
      12:	79 01 00 00 00 00 00 00	r1 = *(u64 *)(r0 + 0)
      13:	07 01 00 00 01 00 00 00	r1 += 1
      14:	7b 10 00 00 00 00 00 00	*(u64 *)(r0 + 0) = r1
      15:	b7 06 00 00 00 00 00 00	r6 = 0

0000000000000080 <LBB2_4>:
      16:	bf 60 00 00 00 00 00 00	r0 = r6
      17:	95 00 00 00 00 00 00 00	exit

Disassembly of section tracepoint/xdp/xdp_redirect_map:

0000000000000000 <trace_xdp_redirect_map>:
       0:	61 12 14 00 00 00 00 00	r2 = *(u32 *)(r1 + 20)
       1:	b7 06 00 00 01 00 00 00	r6 = 1
       2:	b7 01 00 00 01 00 00 00	r1 = 1
       3:	55 02 01 00 00 00 00 00	if r2 != 0 goto +1 <LBB3_2>
       4:	b7 01 00 00 00 00 00 00	r1 = 0

0000000000000028 <LBB3_2>:
       5:	63 1a fc ff 00 00 00 00	*(u32 *)(r10 - 4) = r1
       6:	bf a2 00 00 00 00 00 00	r2 = r10
       7:	07 02 00 00 fc ff ff ff	r2 += -4
       8:	18 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00	r1 = 0 ll
      10:	85 00 00 00 01 00 00 00	call 1
      11:	15 00 04 00 00 00 00 00	if r0 == 0 goto +4 <LBB3_4>
      12:	79 01 00 00 00 00 00 00	r1 = *(u64 *)(r0 + 0)
      13:	07 01 00 00 01 00 00 00	r1 += 1
      14:	7b 10 00 00 00 00 00 00	*(u64 *)(r0 + 0) = r1
      15:	b7 06 00 00 00 00 00 00	r6 = 0

0000000000000080 <LBB3_4>:
      16:	bf 60 00 00 00 00 00 00	r0 = r6
      17:	95 00 00 00 00 00 00 00	exit

Disassembly of section tracepoint/xdp/xdp_exception:

0000000000000000 <trace_xdp_exception>:
       0:	61 11 0c 00 00 00 00 00	r1 = *(u32 *)(r1 + 12)
       1:	b7 02 00 00 05 00 00 00	r2 = 5
       2:	2d 12 01 00 00 00 00 00	if r2 > r1 goto +1 <LBB4_2>
       3:	b7 01 00 00 05 00 00 00	r1 = 5

0000000000000020 <LBB4_2>:
       4:	63 1a fc ff 00 00 00 00	*(u32 *)(r10 - 4) = r1
       5:	bf a2 00 00 00 00 00 00	r2 = r10
       6:	07 02 00 00 fc ff ff ff	r2 += -4
       7:	18 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00	r1 = 0 ll
       9:	85 00 00 00 01 00 00 00	call 1
      10:	b7 01 00 00 01 00 00 00	r1 = 1
      11:	15 00 04 00 00 00 00 00	if r0 == 0 goto +4 <LBB4_4>
      12:	79 01 00 00 00 00 00 00	r1 = *(u64 *)(r0 + 0)
      13:	07 01 00 00 01 00 00 00	r1 += 1
      14:	7b 10 00 00 00 00 00 00	*(u64 *)(r0 + 0) = r1
      15:	b7 01 00 00 00 00 00 00	r1 = 0

0000000000000080 <LBB4_4>:
      16:	bf 10 00 00 00 00 00 00	r0 = r1
      17:	95 00 00 00 00 00 00 00	exit

Disassembly of section tracepoint/xdp/xdp_cpumap_enqueue:

0000000000000000 <trace_xdp_cpumap_enqueue>:
       0:	bf 16 00 00 00 00 00 00	r6 = r1
       1:	b7 00 00 00 01 00 00 00	r0 = 1
       2:	61 61 1c 00 00 00 00 00	r1 = *(u32 *)(r6 + 28)
       3:	63 1a fc ff 00 00 00 00	*(u32 *)(r10 - 4) = r1
       4:	25 01 14 00 3f 00 00 00	if r1 > 63 goto +20 <LBB5_4>
       5:	bf a2 00 00 00 00 00 00	r2 = r10
       6:	07 02 00 00 fc ff ff ff	r2 += -4
       7:	18 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00	r1 = 0 ll
       9:	85 00 00 00 01 00 00 00	call 1
      10:	bf 01 00 00 00 00 00 00	r1 = r0
      11:	b7 00 00 00 00 00 00 00	r0 = 0
      12:	15 01 0c 00 00 00 00 00	if r1 == 0 goto +12 <LBB5_4>
      13:	61 62 18 00 00 00 00 00	r2 = *(u32 *)(r6 + 24)
      14:	79 13 00 00 00 00 00 00	r3 = *(u64 *)(r1 + 0)
      15:	0f 23 00 00 00 00 00 00	r3 += r2
      16:	7b 31 00 00 00 00 00 00	*(u64 *)(r1 + 0) = r3
      17:	61 63 14 00 00 00 00 00	r3 = *(u32 *)(r6 + 20)
      18:	79 14 08 00 00 00 00 00	r4 = *(u64 *)(r1 + 8)
      19:	0f 34 00 00 00 00 00 00	r4 += r3
      20:	7b 41 08 00 00 00 00 00	*(u64 *)(r1 + 8) = r4
      21:	15 02 03 00 00 00 00 00	if r2 == 0 goto +3 <LBB5_4>
      22:	79 12 10 00 00 00 00 00	r2 = *(u64 *)(r1 + 16)
      23:	07 02 00 00 01 00 00 00	r2 += 1
      24:	7b 21 10 00 00 00 00 00	*(u64 *)(r1 + 16) = r2

00000000000000c8 <LBB5_4>:
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
       8:	15 00 0d 00 00 00 00 00	if r0 == 0 goto +13 <LBB6_3>
       9:	61 61 18 00 00 00 00 00	r1 = *(u32 *)(r6 + 24)
      10:	79 02 00 00 00 00 00 00	r2 = *(u64 *)(r0 + 0)
      11:	0f 12 00 00 00 00 00 00	r2 += r1
      12:	7b 20 00 00 00 00 00 00	*(u64 *)(r0 + 0) = r2
      13:	79 01 08 00 00 00 00 00	r1 = *(u64 *)(r0 + 8)
      14:	61 62 14 00 00 00 00 00	r2 = *(u32 *)(r6 + 20)
      15:	0f 21 00 00 00 00 00 00	r1 += r2
      16:	7b 10 08 00 00 00 00 00	*(u64 *)(r0 + 8) = r1
      17:	61 61 1c 00 00 00 00 00	r1 = *(u32 *)(r6 + 28)
      18:	15 01 03 00 00 00 00 00	if r1 == 0 goto +3 <LBB6_3>
      19:	79 01 10 00 00 00 00 00	r1 = *(u64 *)(r0 + 16)
      20:	07 01 00 00 01 00 00 00	r1 += 1
      21:	7b 10 10 00 00 00 00 00	*(u64 *)(r0 + 16) = r1

00000000000000b0 <LBB6_3>:
      22:	b7 00 00 00 00 00 00 00	r0 = 0
      23:	95 00 00 00 00 00 00 00	exit

Disassembly of section tracepoint/xdp/xdp_devmap_xmit:

0000000000000000 <trace_xdp_devmap_xmit>:
       0:	bf 16 00 00 00 00 00 00	r6 = r1
       1:	b7 07 00 00 00 00 00 00	r7 = 0
       2:	63 7a fc ff 00 00 00 00	*(u32 *)(r10 - 4) = r7
       3:	bf a2 00 00 00 00 00 00	r2 = r10
       4:	07 02 00 00 fc ff ff ff	r2 += -4
       5:	18 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00	r1 = 0 ll
       7:	85 00 00 00 01 00 00 00	call 1
       8:	15 00 19 00 00 00 00 00	if r0 == 0 goto +25 <LBB7_5>
       9:	61 61 18 00 00 00 00 00	r1 = *(u32 *)(r6 + 24)
      10:	67 01 00 00 20 00 00 00	r1 <<= 32
      11:	c7 01 00 00 20 00 00 00	r1 s>>= 32
      12:	79 02 00 00 00 00 00 00	r2 = *(u64 *)(r0 + 0)
      13:	0f 12 00 00 00 00 00 00	r2 += r1
      14:	7b 20 00 00 00 00 00 00	*(u64 *)(r0 + 0) = r2
      15:	79 02 10 00 00 00 00 00	r2 = *(u64 *)(r0 + 16)
      16:	07 02 00 00 01 00 00 00	r2 += 1
      17:	61 61 14 00 00 00 00 00	r1 = *(u32 *)(r6 + 20)
      18:	7b 20 10 00 00 00 00 00	*(u64 *)(r0 + 16) = r2
      19:	67 01 00 00 20 00 00 00	r1 <<= 32
      20:	c7 01 00 00 20 00 00 00	r1 s>>= 32
      21:	79 02 08 00 00 00 00 00	r2 = *(u64 *)(r0 + 8)
      22:	0f 12 00 00 00 00 00 00	r2 += r1
      23:	7b 20 08 00 00 00 00 00	*(u64 *)(r0 + 8) = r2
      24:	61 62 24 00 00 00 00 00	r2 = *(u32 *)(r6 + 36)
      25:	15 02 03 00 00 00 00 00	if r2 == 0 goto +3 <LBB7_3>
      26:	79 02 18 00 00 00 00 00	r2 = *(u64 *)(r0 + 24)
      27:	07 02 00 00 01 00 00 00	r2 += 1
      28:	7b 20 18 00 00 00 00 00	*(u64 *)(r0 + 24) = r2

00000000000000e8 <LBB7_3>:
      29:	b7 07 00 00 01 00 00 00	r7 = 1
      30:	65 01 03 00 ff ff ff ff	if r1 s> -1 goto +3 <LBB7_5>
      31:	79 01 18 00 00 00 00 00	r1 = *(u64 *)(r0 + 24)
      32:	07 01 00 00 01 00 00 00	r1 += 1
      33:	7b 10 18 00 00 00 00 00	*(u64 *)(r0 + 24) = r1

0000000000000110 <LBB7_5>:
      34:	bf 70 00 00 00 00 00 00	r0 = r7
      35:	95 00 00 00 00 00 00 00	exit
