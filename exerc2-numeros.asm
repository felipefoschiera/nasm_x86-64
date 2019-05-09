; Lê valores até que seja inserido 0 e mostra o maior valor lido
%include 'util.asm'
%include 'funcoes.asm'

section .text
global _start
extern maior

_start:
    mov r12, 0x8000000000000000 ; r12 = maior 
    loop:
        call readint ; lê inteiro para rax
        cmp rax, 0 ; compara com o 0 e pula para o fim caso igual 
        je fim
        mov rdi, rax ; coloca rax(lido) e r12(atual maior) como parâmetros e chama a função maior
        mov rsi, r12
        call maior
        mov r12, rax ; coloca o maior de volta no r12
        jmp loop

    fim:
        lea rdi, [msg1]
        call printstr
        mov rdi, r12
        call printint
        call endl
        call exit

section .data
msg1:   db 'O maior numero e: ', 0
