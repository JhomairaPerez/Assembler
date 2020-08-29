;Jhomaira Pérez
;Programa que realiza la divicion basica de dos números estaticos no se ingresara por teclado

section .data
msg1 db "La divicion es: "
len1 equ $- msg1

msg2 db 10,"El residuo es: "
len2 equ $- msg2

new_line db 10,""

section .bss
cociente resb 1
residuo resb 1

section .text
  global _start

_start:

;IMPRIMO  MENSAJE 1**********
mov eax, 7
mov ebx, 3
div bl

add al, '0'
mov [cociente],al
add ah, '0'
mov [residuo],ah


mov eax, 4
mov ebx, 1
mov ecx, msg1
mov edx, len1
int 80h

mov eax, 4
mov ebx, 1
mov ecx, cociente
mov edx, 1
int 80h

mov eax, 4
mov ebx, 1
mov ecx, msg2
mov edx, len2
int 80h

mov eax, 4
mov ebx, 1
mov ecx, residuo
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
