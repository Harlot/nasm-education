; Namespace
; Compile with: nasm -f elf namespace.asm
; Link with (64 bit systems require elf_i386 option):
;    ld -m elf_i386 namespace.o -o namespace
; Run with: ./namespace

%include	'functions.asm'

SECTION	.data
; a message string
msg1	db	'Jumping to finished label.', 0h
; a message string
msg2	db	'Inside subroutine number: ', 0h
; a message string
msg3	db	'Inside subroutine "finished".', 0h

SECTION	.text
global	_start

_start:

subrountineOne:
  ; move the address of msg1 into eax 
  mov	eax, msg1
  ; call our string printing with linefeed function
  call	sprintLF
  ; jump to the local label under the subrountineOne scope
  jmp	.finished

.finished:
  ; move the address of msg2 into eax
  mov	eax, msg2
  ; call our string printing function
  call sprint
  ; move the value one into eax (for subroutine number one)
  mov	eax, 1
  ; call our integer printing function with linefeed function
  call	iprintLF

subrountineTwo:
  ; move the address of msg1 into eax
  mov	eax, msg1
  ; call our string print with linefeed function
  call	sprintLF
  ; jump to the local label under the subrountineTwo scope
  jmp	.finished

.finished:
  ; move the address of msg2 into eax
  mov	eax, msg1
  ; call our string printing function
  call sprint
  ; move the value of two into eax (for subroutine two)
  mov	eax, 2
  ; call our integer printing function with linefeed function
  call	iprintLF

  ; move the address of msg1 into eax
  mov	eax, msg1
  ; call our string printing with linefeed function
  call	sprintLF
  ; jump to the global label finished
  jmp	finished

finished:
  ; move the address of msg3 into eax
  mov	eax, msg3
  ; call our string printing with linefeed function
  call	sprintLF
  ; call our quit function
  call	quit
