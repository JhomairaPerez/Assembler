;Jhomaira Pérez
;SUMA BASICA de dos numeros estaticos no se ingresara por teclado
section .data
msg3 db "La suma es: "
len3 equ $- msg3

section .bss
suma resb 1

section .txt
  global _start

_start:

;IMPRIMO  MENSAJE 1**********
mov eax, 6
mov ebx, 2
add eax, ebx ; eax = eax +ebx
add eax, '0'
mov [suma],eax


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
