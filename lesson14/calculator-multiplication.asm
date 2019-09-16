; Calculator (Multiplication)
; Compile with: nasm -f elf calculator-multiplication.asm
; Link with (64 bit systems require elf_i386 option):
;   ld -m elf_i386 calculator-multiplication.o -o calculator-multiplication
; Run with: ./calculator-mutliplication

%include	'functions.asm'

SECTION	.text
global	_start

_start:

  ; move our first number into eax
  mov	eax, 90
  ; move our second number into ebx
  mov 	ebx, 9
  ; multiply eax by ebx
  mul	ebx
  ; call our integer print with linefeed function
  call	iprintLF

  call	quit
