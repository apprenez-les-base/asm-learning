; Terminal :

; nasm -f elf64 -g -F dwarf main.s -o main.o
; ld main.o -o main
; gdb ./main

; Dans GDB :

; starti
; si
; si
; info registers



BITS 64

global _start

_start:
    mov rax, 45
    push rax ; -> Ajouté une valeur tout en haut de la boite
    pop rdi; -> Retiré une valeur de tout en haut de la boite -> pour la metre dans une autre valeur example rdi
    jmp _exit

_exit:
    mov rax, 0x3C
    mov rdi, 0
    syscall