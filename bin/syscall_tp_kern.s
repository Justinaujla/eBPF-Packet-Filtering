
./ebpf-samples/all/syscall_tp_kern.o:	file format elf64-bpf

Disassembly of section tracepoint/syscalls/sys_enter_open:

0000000000000000 <trace_enter_open>:
       0:	b7 01 00 00 00 00 00 00	r1 = 0
       1:	63 1a fc ff 00 00 00 00	*(u32 *)(r10 - 4) = r1
       2:	b7 01 00 00 01 00 00 00	r1 = 1
       3:	63 1a f8 ff 00 00 00 00	*(u32 *)(r10 - 8) = r1
       4:	bf a2 00 00 00 00 00 00	r2 = r10
       5:	07 02 00 00 fc ff ff ff	r2 += -4
       6:	18 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00	r1 = 0 ll
       8:	85 00 00 00 01 00 00 00	call 1
       9:	15 00 04 00 00 00 00 00	if r0 == 0 goto +4 <LBB0_2>
      10:	61 01 00 00 00 00 00 00	r1 = *(u32 *)(r0 + 0)
      11:	07 01 00 00 01 00 00 00	r1 += 1
      12:	63 10 00 00 00 00 00 00	*(u32 *)(r0 + 0) = r1
      13:	05 00 08 00 00 00 00 00	goto +8 <LBB0_3>

0000000000000070 <LBB0_2>:
      14:	bf a2 00 00 00 00 00 00	r2 = r10
      15:	07 02 00 00 fc ff ff ff	r2 += -4
      16:	bf a3 00 00 00 00 00 00	r3 = r10
      17:	07 03 00 00 f8 ff ff ff	r3 += -8
      18:	18 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00	r1 = 0 ll
      20:	b7 04 00 00 01 00 00 00	r4 = 1
      21:	85 00 00 00 02 00 00 00	call 2

00000000000000b0 <LBB0_3>:
      22:	b7 00 00 00 00 00 00 00	r0 = 0
      23:	95 00 00 00 00 00 00 00	exit

Disassembly of section tracepoint/syscalls/sys_exit_open:

0000000000000000 <trace_enter_exit>:
       0:	b7 01 00 00 00 00 00 00	r1 = 0
       1:	63 1a fc ff 00 00 00 00	*(u32 *)(r10 - 4) = r1
       2:	b7 01 00 00 01 00 00 00	r1 = 1
       3:	63 1a f8 ff 00 00 00 00	*(u32 *)(r10 - 8) = r1
       4:	bf a2 00 00 00 00 00 00	r2 = r10
       5:	07 02 00 00 fc ff ff ff	r2 += -4
       6:	18 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00	r1 = 0 ll
       8:	85 00 00 00 01 00 00 00	call 1
       9:	15 00 04 00 00 00 00 00	if r0 == 0 goto +4 <LBB1_2>
      10:	61 01 00 00 00 00 00 00	r1 = *(u32 *)(r0 + 0)
      11:	07 01 00 00 01 00 00 00	r1 += 1
      12:	63 10 00 00 00 00 00 00	*(u32 *)(r0 + 0) = r1
      13:	05 00 08 00 00 00 00 00	goto +8 <LBB1_3>

0000000000000070 <LBB1_2>:
      14:	bf a2 00 00 00 00 00 00	r2 = r10
      15:	07 02 00 00 fc ff ff ff	r2 += -4
      16:	bf a3 00 00 00 00 00 00	r3 = r10
      17:	07 03 00 00 f8 ff ff ff	r3 += -8
      18:	18 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00	r1 = 0 ll
      20:	b7 04 00 00 01 00 00 00	r4 = 1
      21:	85 00 00 00 02 00 00 00	call 2

00000000000000b0 <LBB1_3>:
      22:	b7 00 00 00 00 00 00 00	r0 = 0
      23:	95 00 00 00 00 00 00 00	exit
