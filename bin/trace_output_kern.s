
./ebpf-samples/all/trace_output_kern.o:	file format elf64-bpf

Disassembly of section kprobe/sys_write:

0000000000000000 <bpf_prog1>:
       0:	bf 16 00 00 00 00 00 00	r6 = r1
       1:	85 00 00 00 0e 00 00 00	call 14
       2:	7b 0a f0 ff 00 00 00 00	*(u64 *)(r10 - 16) = r0
       3:	b7 01 00 00 78 56 34 12	r1 = 305419896
       4:	7b 1a f8 ff 00 00 00 00	*(u64 *)(r10 - 8) = r1
       5:	bf a4 00 00 00 00 00 00	r4 = r10
       6:	07 04 00 00 f0 ff ff ff	r4 += -16
       7:	bf 61 00 00 00 00 00 00	r1 = r6
       8:	18 02 00 00 00 00 00 00 00 00 00 00 00 00 00 00	r2 = 0 ll
      10:	b7 03 00 00 00 00 00 00	r3 = 0
      11:	b7 05 00 00 10 00 00 00	r5 = 16
      12:	85 00 00 00 19 00 00 00	call 25
      13:	b7 00 00 00 00 00 00 00	r0 = 0
      14:	95 00 00 00 00 00 00 00	exit