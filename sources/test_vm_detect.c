#include <stdio.h>
#include <string.h>

int main() {

  char vendor[13];
  memset (vendor, 0, sizeof vendor);

  unsigned int eax = 0x40000000;
  unsigned int *sig = (unsigned int *) vendor;

  asm volatile (
        "xchgl %%ebx,%1; xor %%ebx,%%ebx; cpuid; xchgl %%ebx,%1"
        : "=a" (eax), "+r" (sig[0]), "=c" (sig[1]), "=d" (sig[2])
        : "0" (eax));
  vendor[12] = 0;

  if (!strcmp(vendor, "KVMKVMKVM")) {
     puts ("This is a KVM guest.");
  } else if (!strcmp(vendor, "VMwareVMware")) {
     puts ("This is a VMWare guest.");
  } else if (!strcmp(vendor, "Microsoft Hv")) {
     puts ("This is a Microsoft Hyper-V or Windows Virtual PC guest");
  } else if (!strcmp(vendor, "XenVMMXenVMM")) {
     puts ("This is a Xen HVM guest.");
  } else {
     puts ("This is a host or hypervisor is not detected correctly.");
  }

  return 0;
}