
./ebpf-samples/all/packet_overflow.o:	file format elf64-bpf

Disassembly of section xdp:

0000000000000000 <read_write_packet_start>:
       0:	b7 00 00 00 01 00 00 00	r0 = 1
       1:	61 12 00 00 00 00 00 00	r2 = *(u32 *)(r1 + 0)
       2:	61 11 04 00 00 00 00 00	r1 = *(u32 *)(r1 + 4)
       3:	2d 12 04 00 00 00 00 00	if r2 > r1 goto +4 <LBB0_2>
       4:	61 21 00 00 00 00 00 00	r1 = *(u32 *)(r2 + 0)
       5:	07 01 00 00 01 00 00 00	r1 += 1
       6:	63 12 00 00 00 00 00 00	*(u32 *)(r2 + 0) = r1
       7:	b7 00 00 00 00 00 00 00	r0 = 0

0000000000000040 <LBB0_2>:
       8:	95 00 00 00 00 00 00 00	exit
