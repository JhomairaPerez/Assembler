section .data
    msj1 db "Nombres: Jhomaira Alexandra",10
    len1 equ $-msj1

    msj2 db "Apellidos: Perez Quezada",10
    len2 equ $-msj2

    msj3 db "Edad: 22",10
    len3 equ $-msj3

    msj4 db "Genero: Femenino",10
    len4 equ $-msj4

section .bss

section .txt
	global _start

_start:

	mov eax, 4
	mov ebx, 1
	mov ecx, msj1
	mov edx, len1
	int 80h
	
	mov eax, 4
	mov ebx, 1
	mov ecx, msj2
	mov edx, len2
	int 80h

	mov eax, 4
	mov ebx, 1
	mov ecx, msj3
	mov edx, len3
	int 80h

	mov eax, 4
	mov ebx, 1
	mov ecx, msj4
	mov edx, len4	
	int 80h

