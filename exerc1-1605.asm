%include 'util.asm'

section		.text
global 		_start

_start:
	xor rbx, rbx
	loop:
		call readint
		mov [vet+rbx*8], rax
		inc rbx
		cmp rbx, 8
		je exibicao
		jmp loop

	exibicao:
		mov rbx, 8	
		.loop2:
			dec rbx
			cmp rbx, -1
			je .fim
			mov rdi, [vet+rbx*8]
			cmp rdi, 0
			jne .mostrar
			jmp .loop2

		.mostrar:
			call printint
			lea rdi, [espaco]
			call printstr
			jmp .loop2

		.fim:
			call endl
			call exit

section		.bss
	vet:	resq 8

section		.data
	espaco:	db ' ', 0
