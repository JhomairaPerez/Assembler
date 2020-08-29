; JhomairaPerez
;22-07-2020
;Hacer un cuadrado de asterisco
%macro escribir 2
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro

%macro leer 2
  mov eax, 3
  mov ebx, 0
  mov ecx, %1
  mov edx, %2
  int 80h
%endmacro

section .data

    asterisco db "*"
    espacio db '',10

section .text
    global _start
_start:

    mov eax, 9
    mov ebx, 9
    jmp fila

fila:
    push eax ; 9
    push ebx ; 9
    escribir asterisco,1
    pop ebx ;9
    pop eax ;9

    dec eax ; 8

    cmp eax, 0
    jz columna
    jmp fila

columna:
    dec ebx
    push ebx
    escribir espacio,1
    pop ebx
    mov eax, 9
    cmp ebx,0
    jz salir
    jmp fila



salir:
    mov eax, 1
    int 80h
