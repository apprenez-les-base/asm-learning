BITS 64

; cmp <registers>, <value>

; Comparaisons non signées
;
; je  : jump if equal            -> val1 == val2
; jne : jump if not equal        -> val1 != val2
; ja  : jump if above            -> val1 >  val2
; jae : jump if above or equal   -> val1 >= val2
; jb  : jump if below            -> val1 <  val2
; jbe : jump if below or equal   -> val1 <= val2
;
; Comparaisons signées
;
; je  : jump if equal            -> val1 == val2
; jne : jump if not equal        -> val1 != val2
; jg  : jump if greater          -> val1 >  val2
; jge : jump if greater or equal -> val1 >= val2
; jl  : jump if less             -> val1 <  val2
; jle : jump if less or equal    -> val1 <= val2

; This Code is all meke by kirobotdev

global _main

section .text

_main:
    mov rax, 1337
    cmp rax, 1337
    je _true
    jne _false

_true:
    mov rdi, 100
    jmp _exit

_false:
    mov rdi, 200
    jmp _exit

_exit:
    mov rax, 60
    syscall