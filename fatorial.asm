%include 'util.asm'

section .text
global _start

fatorial:
    cmp rdi, 1
    jle retorna1 
    push rdi
    dec rdi
    call fatorial
    pop rbx    
    imul rax, rbx
    ret
    retorna1:
        mov rax, 1
        ret

_start:
    lea rdi, [msg1]
    call printstr
    call readint
    mov rbx, rax
    mov rdi, rax
    call fatorial
    mov r12, rax
    lea rdi, [msg2]
    call printstr
    mov rdi, rbx
    call printint
    lea rdi, [msg3]
    call printstr
    mov rdi, r12
    call printint
    call endl
    call exit


section .data
msg1:   db 'Insira n: ', 0
msg2:   db 'Fatorial de ', 0
msg3:   db ': ', 0
