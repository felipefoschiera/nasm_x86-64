; Percorre o vetor mostrando os elementos
%include    'util.asm'

section     .text
global      _start

_start:
    xor         rbx, rbx ; zera registrador
    .loop: 
        mov     rdi, [vet+rbx*8] ; Passa pelos bytes
        call    printint
        call    endl
        inc     rbx
        cmp     rbx, 5
        jl      .loop

        call    exit

section     .data
vet: dq     100, 15, 4300, -1, 55
