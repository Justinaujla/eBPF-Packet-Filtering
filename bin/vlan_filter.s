
./ebpf-samples/all/vlan_filter.o:	file format elf64-bpf

Disassembly of section filter:

0000000000000000 <hashfilter>:
       0:	18 00 00 00 ff ff ff ff 00 00 00 00 00 00 00 00	r0 = 4294967295 ll
       2:	61 11 18 00 00 00 00 00	r1 = *(u32 *)(r1 + 24)
       3:	57 01 00 00 ff 0f 00 00	r1 &= 4095
       4:	15 01 02 00 02 00 00 00	if r1 == 2 goto +2 <LBB0_3>
       5:	15 01 01 00 04 00 00 00	if r1 == 4 goto +1 <LBB0_3>
       6:	b7 00 00 00 00 00 00 00	r0 = 0

0000000000000038 <LBB0_3>:
       7:	95 00 00 00 00 00 00 00	exit
