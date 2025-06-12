# SaintKernel

**SaintKernel** is a super basic, bare-bones kernel written in C and Assembly, made just for learning and experimentation.  
It doesn’t include input, filesystem, or multitasking — only direct output to the screen via video memory.

🧠 Made in about 15–20 minutes for study purposes.

## Requirements

- `nasm` — to assemble the bootloader or entry code
- `xorriso` — to create the bootable ISO
- `grub` — to boot the kernel (via multiboot)
- `qemu` (optional) — to emulate and test the kernel

## Usage

1. Clone the repo  
2. (Optional) Edit `kernel.c` to change the printed message
3. Build with:

```bash
make
```

## Run it using QEMU
```bash
qemu-system-i386 -cdrom kernel.iso
```

## Notes
The kernel writes directly to VGA text mode (0xB8000)

There is no input handling, file system, or memory management yet

Made purely for educational and testing purposes
