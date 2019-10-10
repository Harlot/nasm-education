; Calculator (Division)
; Compile with: $ nasm -f elf calculator-division.asm
; Link with (64 bit systems require elf_i386 option):
;   $ ld -m elf_i386 calculator-division.o -o calculator-division
; Run with: $ ./calculator-division

%include	'functions.asm'

SECTION	.data
; a message string to correctly output result
msg1	db	' remainder '

SECTION .text
global _start

_start:

  ; move our first number into eax
  mov	eax, 90
  ; move our second number into ebx
  mov	ebx, 9
  ; divide eax by ebx
  div	ebx
  ; call our integer print function on the quotient
  call	iprint
  ; move our message string into eax
  mov	eax, msg1
  ; call our string print function
  call	sprint
  ; move our remainder into eax
  mov	eax, edx
  ; call our integer printing with linefeed function
  call	iprintLF

  call	quit
