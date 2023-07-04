
./ebpf-samples/all/task_fd_query_kern.o:	file format elf64-bpf

Disassembly of section kprobe/blk_start_request:

0000000000000000 <bpf_prog1>:
       0:	b7 00 00 00 00 00 00 00	r0 = 0
       1:	95 00 00 00 00 00 00 00	exit

Disassembly of section kretprobe/blk_account_io_completion:

0000000000000000 <bpf_prog2>:
       0:	b7 00 00 00 00 00 00 00	r0 = 0
       1:	95 00 00 00 00 00 00 00	exit
