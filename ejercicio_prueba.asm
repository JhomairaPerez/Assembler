%macro escribir 2
  mov eax, 4
	mov ebx, 1
	mov ecx, %1
	mov edx, %2
	int 80h
%endmacro

section .data
    msj db "Mi nombre es: "
    len equ $-msj

    msjSuma db "Jhomaira Pérez",10
    lenSuma equ $-msjSuma

section .bss
section .txt
	global _start

_start:

	escribir msj,len
	escribir msjSuma, lenSuma
	jmp salir

	;mov eax, 4 tipo de operacion
	;mov ebx, 1 estandar
	;mov ecx, msj variables o constantes
	;mov edx, len numero de caracteres

salir:
	mov eax, 1
	int 80h
