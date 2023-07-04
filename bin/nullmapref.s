
./ebpf-samples/all/nullmapref.o:	file format elf64-bpf

Disassembly of section test:

0000000000000000 <test_repro>:
       0:	b7 06 00 00 01 00 00 00	r6 = 1
       1:	63 6a fc ff 00 00 00 00	*(u32 *)(r10 - 4) = r6
       2:	bf a2 00 00 00 00 00 00	r2 = r10
       3:	07 02 00 00 fc ff ff ff	r2 += -4
       4:	18 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00	r1 = 0 ll
       6:	85 00 00 00 01 00 00 00	call 1
       7:	63 60 00 00 00 00 00 00	*(u32 *)(r0 + 0) = r6
       8:	b7 00 00 00 00 00 00 00	r0 = 0
       9:	95 00 00 00 00 00 00 00	exit
