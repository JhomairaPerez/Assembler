;JhomairaPerez
;03-08-2020
%macro lee 1
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, 1
    int 80H
%endmacro

section .data
  asterisco db "*"
  new_line db 10, ""

section .text
  global _start

_start:
          mov ecx, 8
          mov ebx, 1

  l1:
          push ecx
          push ebx


          mov ecx, ebx ; se pcomenta si el triangulo quiere invertido al de este
          ;pop ecx
          ;push ecx

  l2:

          push ecx

          ;*******asterisco*********
          mov eax, 4
          mov ebx, 1
          mov ecx, asterisco
          mov edx, 1
          int 80h

          pop ecx
          loop l2
          ;finalizo loop columnas
          ;*******nueva lineas**********

          mov eax, 4
          mov ebx, 1
          mov ecx, new_line
          mov edx, 1
          int 80h

          pop ebx
          pop ecx
          inc ebx
          loop l1
          ;finalizo loop filas


salir:
          mov eax, 1
          int 80h
