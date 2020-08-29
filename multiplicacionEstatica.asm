;Jhomaira Pérez
;Programa que realiza la multiplicacion basica de dos números estaticos no se ingresara por teclado clase

section .data
msg1 db "La multiplicacion es: "
len1 equ $- msg1

new_line db 10,""

section .bss
resul resb 1

section .text
  global _start

_start:

;IMPRIMO  MENSAJE 1**********
mov eax, 2
mov ebx, 3
mul bl
add eax, '0'
mov [resul],eax


mov eax, 4
mov ebx, 1
mov ecx, msg1
mov edx, len1
int 80h

mov eax, 4
mov ebx, 1
mov ecx, resul
mov edx, 1
int 80h

mov eax, 4
mov ebx, 1
mov ecx, new_line
mov edx, 1
int 80h

;SALIDA************
mov eax, 1
int 80h
