; Calculator (Subtraction)
; Compile with: nasm -f elf calculator-subtraction.asm
; Link with (64 bit systems require elf_i386 option):
;   ld -m elf_i386 calculator-subtraction.o -o calculator-subtraction

%include	'functions.asm'

SECTION	.text
global	_start

_start:

  ; move our first number into eax
  mov	eax, 90
  ; move our second number into ebx
  mov	ebx, 9
  ; subtract ebx from eax
  sub	eax, ebx
  ; call our integer print with linefeed function
  call	iprintLF

  call	quit
