%include 'util.asm'

section		.text
global 		_start

_start:
	xor rbx, rbx
	xor r12, r12 ; r12 -> par
	xor r13, r13 ; r13 -> impar
	loop:
		call readint
		mov [vet+rbx*8], rax

		xor r14, r14 ; zera r14
		shr rax, 1 ; salva o bit mais à direita no carry flag
		adc r14, 0 ; r14 <- r14 + 0 + CF
		add r13, r14 ; adiciona pro contador de impar (1 ou 0)
		xor r14, 1   ; inverte o carry flag salvo em r14
		add r12, r14 ; adiciona pro contador de par (1 ou 0)
		inc rbx 
		cmp rbx, 6
		je fim
		jmp loop

	fim:
		lea rdi, [msg1]
		call printstr
		mov rdi, r12
		call printint
		call endl
		lea rdi, [msg2]
		call printstr
		mov rdi, r13
		call printint
		call endl
		call exit



section		.bss
	vet: 	resq 6

section		.data
	msg1:	db 'Numero de pares: ', 0
	msg2:	db 'Numero de impares: ', 0
