all: kernel.iso

boot.o: boot.asm
	nasm -f elf32 boot.asm -o boot.o

kernel.o: kernel.c 
	gcc -m32 -ffreestanding -c kernel.c -o kernel.o

kernel.bin: boot.o kernel.o linker.ld
	ld -m elf_i386 -T linker.ld -o kernel.bin boot.o kernel.o

kernel.iso: kernel.bin
	mkdir -p isodir/boot/grub
	cp kernel.bin isodir/boot/kernel.bin
	echo "set timeout=0" > isodir/boot/grub/grub.cfg
	echo 'menuentry "Saint Kernel" {  multiboot /boot/kernel.bin }' >> isodir/boot/grub/grub.cfg
	grub-mkrescue -o kernel.iso isodir
clean:
	rm -rf *.o *.bin *.iso isodir
