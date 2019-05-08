; Hello World Program (External file include)
; Compile with: nasm -f elf helloworld-inc.asm
; Link with (64 bit systems require elf_i386 option):
;  ld -m elf_i386 helloworld-inc.o -o helloworld-inc
; Run with: ./helloworld-inc

%include	'functions.asm'

SECTION	.data
; our fist message string
msg1	db	'Hello, brave new world!', 0Ah
; out second message string
msg2	db	'This is how we recycle in NASM', 0Ah

SECTION .text
global _start

_start:

  ; move the address of our first message string into EAX
  mov	eax, msg1
  ; call out string printing function
  call sprint

  ; move the address of our second message string into EAX
  mov	eax, msg2
  ; call our string printing function
  call sprint

  ; call our quit function
  call quit
