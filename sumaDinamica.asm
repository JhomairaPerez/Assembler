;Jhomaira Perez
;imprimir suma ingresados por teclado

section .data
msg1 db "Ingrese el primer numero: "
len1 equ $- msg1

msg2 db "Ingrese el segundo numero "
len2 equ $- msg2

msg3 db "La suma es: "
len3 equ $- msg3

section .bss
num1 resb 2
num2 resb 2
suma resb 1

section .txt
  global _start

_start:


;IMPRIMO  MENSAJE 1**********
mov eax, 4
mov ebx, 1
mov ecx, msg1
mov edx, len1
int 80h

;LECTURA NUMERO  *************
mov eax, 3
mov ebx, 0
mov ecx, num1
mov edx, 2
int 80h

;IMPRIMO  MENSAJE 2***********
mov eax, 4
mov ebx, 1
mov ecx, msg2
mov edx, len2
int 80h

;IMPRIME NUMERO  *************
mov eax, 3
mov ebx, 0
mov ecx, num2
mov edx, 2
int 80h

;SUMA * *****
mov eax, [num1]
mov ebx, [num2]
sub eax, '0' ;valores convertidos en digito
sub ebx, '0' ;valores convertidos en digito
add eax, ebx ; eax = eax +ebx
add eax, '0' ;;valores convertidos a cadena

mov [suma],eax

;IMPRIME RESUL ******

mov eax, 4
mov ebx, 1
mov ecx, msg3
mov edx, len3
int 80h

mov eax, 4
mov ebx, 1
mov ecx, suma
mov edx, 1
int 80h


;SALIDA************
mov eax, 1
int 80h

;para transformar de numero a cadena se suma '0'
;add registro, registro, '0'
;sub registro, '0'
;para transformar un cadena a numero se resta (sub)
