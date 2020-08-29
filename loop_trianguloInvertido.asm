;JhomairaPerez
;6 to
;29-07-2020
;Triangulo invertido
section .data
		asterisco db '*'
		nueva_linea db 10,'',10
section .text
		global _start

_start:
  	mov ecx, 9
  	mov ebx, 9
l1:
  	push ecx		;se envia la referencia de ecx a pila
  	mov ebx, ecx
  	push ebx

    mov eax, 4
  	mov ebx, 1
  	mov ecx, nueva_linea
  	mov edx, 1
  	int 80h

  	pop ebx
  	mov ecx, ebx
  	push ebx

l2:
  	push ecx
    mov eax, 4
    mov ebx, 1
    mov ecx, asterisco
    mov edx, 1
    int 80h

  	pop ecx
  	loop l2

  	pop ecx
  	pop ebx
  	loop l1

    mov eax, 4
    mov ebx, 1
    mov ecx, nueva_linea
    mov edx, 1
    int 80h

salir:
    mov eax, 1
  	int 80h
