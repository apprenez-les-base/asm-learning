; SECTION = [BSS, RODATA, TEXT]

; .bss => section où l'on stocke les variables non initialisées
; exemple : int age; char buffer[256];

; .rodata => section où l'on stocke les données initialisées en lecture seule
; exemple : const char *hello = "Hello, world";

; .data => section où l'on stocke les variables initialisées et modifiables
; exemple : int age = 1337; age = 4;

; char buffer[] = "Hello, world" => généralement placé dans .data
; si déclaré avec const, la chaîne peut être placée dans .rodata

; .text => section où l'on met le code qui va être exécuté

; global _start => rend _start accessible à l'éditeur de liens
; _start est le point d'entrée du programme lorsqu'on utilise _start
; ce n'est pas exactement l'équivalent de int main() en C

; AT&T => syntaxe différente, souvent moins intuitive au début
; Intel => syntaxe généralement plus claire

; rax => 64 bits | eax -> 32 bits | ax -> 16 bits
; rbx => 64 bits | ebx -> 32 bits | bx -> 16 bits
; rcx => 64 bits | ecx -> 32 bits | cx -> 16 bits
; rdx => 64 bits | edx -> 32 bits | dx -> 16 bits
; rsi => 64 bits | esi -> 32 bits | si -> 16 bits
; rdi => 64 bits | edi -> 32 bits | di -> 16 bits
; rbp => 64 bits | ebp -> 32 bits | bp -> 16 bits
; rsp => 64 bits | esp -> 32 bits | sp -> 16 bits

; rax = 45

; mov <destination>, <source>

; Example : mov rax, 45 -> rax = 45

; syscall => appel kernel

; db => define bytes => 1 octet -> 8bits

; dw => define word => 2 octet -> 16bits

; dd => define double word => 4octet -> 32bits

; sys_write => Write in terminal

; sys_read => Read terminal

; On peut appeller nos section comme il nous s'emble
section .rodata:
    ; On crée notre variable on defininie un char qu'on veux entré dedant via db "", 10 => \n, 0 => Fini
    helloworld db "Hello, World", 10, 0
    helloworld_len equ $-helloworld ; ici on regarde la taille de notre Chaine de char et on retourne en fesant equ $-nom variable on retourne le contenue qu'on demande

section .text
    global _start

_start:
    mov rax, 1 ; mov <destination> <source>
    mov rdi, 1
    mov rsi, helloworld
    mov rdx, helloworld_len
    syscall
    jmp _exit

; Etiquette pour quitter
_exit:
    ; mov rax => 60 == Exit
    mov rax, 60
    mov rdi, 0 ; rdi = 0 == Code de sortie
    syscall ; Call kernel
