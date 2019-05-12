; Hello World Program (Getting input)
; There is a point asmtutor stops calling these Hello World, right?
; Compile with: nasm -f elf helloworld-input.asm
; Link with (64 bit systems require elf_i382 option):
;   ld -m elf_i386 helloworld-input.o -o helloworld-input
; Run with: ./helloworld-input

%include 'functions.asm'

SECTION .data
msg1	db	'Pleast enter your name: ',0h
; message string asking user for input
msg2	db	'Hello, ',0h
; message string to use after user has entered their name

SECTION	.bss
sinput:	resb	255
; reserve a 255 byte space in memory for the users input

SECTION	.text
global	_start

_start:

  mov	eax,msg1
  call	sprint

  mov	edx, 255
  ; number of bytes to read
  mov	ecx, sinput
  ; reserve space to store our input (known as a buffer)
  mov	ebx, 0
  ; write to the STDIN file
  mov	eax, 3
  ; invoke SYS_READ (kernel opcode 3)
  int	80h

  mov	eax, msg2
  call	sprint

  mov	eax, sinput
  ; move our buffer into eax (Note: input contains a linefeed)
  call	sprint
  ; call our print function

  call quit
