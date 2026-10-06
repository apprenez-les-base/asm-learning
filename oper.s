; add <destination> <Source>
; sub <destination> <source>
; div <destisnation>
; nul <source>

BITS 64

global _start

SECTION .code

_start:
    mov rax, 789
    add rax, 1337
