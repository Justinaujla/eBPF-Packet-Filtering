
./ebpf-samples/all/filter.o:	file format elf64-bpf

Disassembly of section filter:

0000000000000000 <hashfilter>:
       0:	18 02 00 00 0e 00 e0 ff 00 00 00 00 00 00 00 00	r2 = 4292870158 ll
       2:	63 21 30 00 00 00 00 00	*(u32 *)(r1 + 48) = r2
       3:	61 11 10 00 00 00 00 00	r1 = *(u32 *)(r1 + 16)
       4:	b7 00 00 00 ff ff ff ff	r0 = -1
       5:	55 01 01 00 86 dd 00 00	if r1 != 56710 goto +1 <LBB0_2>
       6:	b7 00 00 00 00 00 00 00	r0 = 0

0000000000000038 <LBB0_2>:
       7:	95 00 00 00 00 00 00 00	exit
