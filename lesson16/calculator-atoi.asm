; Calculator (ATOI)
; Compile with: nasm -f elf calculator-atoi.asm
; Link with (64 bit systems require elf_i386 option):
;      ld -m elf_i386 calculator-atoi.o -o calculator-atoi
; Run with: ./calculator-atoi 20 1000 317

%include	'functions.asm'

SECTION	.text
global	_start

_start:

  pop	ecx
  pop	edx
  sub	ecx, 1
  mov	edx, 0

nextArg:
  cmp	ecx, 0h
  jz	noMoreArgs
  pop	eax
  call	atoi
  add	edx, eax
  dec	ecx
  jmp	nextArg

noMoreArgs:
  mov	eax, edx
  call	iprintLF
  call	quit
