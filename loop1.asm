;JhomairaPerez
;29-07-2020
section .data
  saludo db 'Hola', 10
  len_saludo equ $-saludo

section .bss
  num resb 1

section .text
  global _start

_start:
  mov ecx, 10

for:
  push ecx
  mov eax,4
  mov ebx, 1
  mov ecx, saludo ;El valor para decrementar debe ser numerico
  mov edx, len_saludo
  int 80H

  pop ecx
  loop for ;por cada ciclo de cx, los ciclos se ejecutan hasta cx = 0

salir:
  mov eax, 1
  int 80h
