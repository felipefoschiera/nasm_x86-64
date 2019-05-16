%include 'util.asm'

section		.text
global 		_start

_start:

section		.bss ; dados não inicializados
	vet:		resq 1000 ; vetor de tamanho 1000

section		.data ; dados inicializados
	vet: 	dq 0 times 1000
