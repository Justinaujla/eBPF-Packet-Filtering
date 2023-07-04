
./ebpf-samples/all/ringbuf_uninit.o:	file format elf64-bpf

Disassembly of section .text:

0000000000000000 <test>:
       0:	bf a2 00 00 00 00 00 00	r2 = r10
       1:	07 02 00 00 f8 ff ff ff	r2 += -8
       2:	18 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00	r1 = 0 ll
       4:	b7 03 00 00 08 00 00 00	r3 = 8
       5:	b7 04 00 00 00 00 00 00	r4 = 0
       6:	85 00 00 00 82 00 00 00	call 130
       7:	b7 00 00 00 00 00 00 00	r0 = 0
       8:	95 00 00 00 00 00 00 00	exit
