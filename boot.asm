[bits 32]
global _start
extern kernel_main

section .multiboot
align 4
	dd 0x1BADB002
	dd 0x00000000
	dd 0x0E4524FFE

section .text

_start:
	call kernel_main
.hang:
	jmp .hang
