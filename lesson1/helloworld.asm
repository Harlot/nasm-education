; Hello World Program - asmtutor.com
; Compile with: nasm -f elf helloworld.asm
; Link with (64 bit systems require elf_i386 option): \
;     ld -m elf_i386 helloworld.o -o helloworld
; Run with: ./helloworld

SECTION .data
msg	db	'Hello World!', 0Ah
; assign msg variable with your message string

SECTION .text
global	_start

_start:
; number of bytes to write - one for each letter plus 0Ah (line feed)
  mov	edx,13
; move the memory address of our message string into ecx
  mov	ecx, msg
; write to the STDOUT file
  mov	ebx, 1
; invoke SYS_WRITE (kernel opcode 4)
  mov	eax, 4
  int	80h
 
