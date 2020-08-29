section .data
msg1 db "Ingrese un numero: "
len1 equ $- msg1

msg2 db "El numero ingresado es: "
len2 equ $- msg2

section .bss
num resb 5

section .txt
global _start

_start:

;IMPRIMO  MENSAJE 1**********
mov eax, 4
mov ebx, 1
mov ecx, msg1
mov edx, len1
int 80h


mov ebx, 7
mov [num], ebx

;LECTURA NUMERO  *************
;mov eax, 3
;mov ebx, 0
;mov ecx, num
;mov edx, 5
;int 80h

;IMPRIMO  MENSAJE 2***********
mov eax, 4
mov ebx, 1
mov ecx, msg2
mov edx, len2
int 80h

;IMPRIME NUMERO  *************
mov eax, 4
mov ebx, 1
mov ecx, num
mov edx, 5
int 80h


;SALIDA************
mov eax, 1
int 80h
