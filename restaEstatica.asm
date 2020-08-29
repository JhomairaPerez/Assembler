;Jhomaira Pérez
;Programa que realiza la resta basica de dos números estaticos no se ingresara por teclado

section .data
msg1 db "La resta es: "
len1 equ $- msg1

new_line db 10,""

section .bss
resta resb 1

section .text
  global _start

_start:

;IMPRIMO  MENSAJE 1**********
mov eax, 6
mov ebx, 3
sub eax, ebx ; eax = eax - ebx
add eax, '0'
mov [resta],eax


mov eax, 4
mov ebx, 1
mov ecx, msg1
mov edx, len1
int 80h

mov eax, 4
mov ebx, 1
mov ecx, resta
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
