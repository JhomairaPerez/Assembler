;JhomairaPerez
;03-08-2020
;TABLA DE MULTIPLICAR ESTATICA DEL 3
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
    men db "3 "
    newLine db '',10
    asterisco db ' * '
    len_asterisco equ $- asterisco
    msjIgual db ' = '
section .bss
    dlIn resb 2
    r resb 2
section .text
    global _start
_start:

    mov al, 3
    mov dl,0

multiplicar:
    inc dl
    push eax
    push edx
    mul dl

    ;convertir
    add eax, '0'
    mov [r], eax

    ;Obtener el valor del incremento
    mov ax,dx
    add ax, '0'
    mov [dlIn], ax

    escribir men,1
    escribir asterisco, len_asterisco
    escribir dlIn,2
    escribir msjIgual,3
    escribir r, 2
    escribir newLine,1

    pop edx
    pop eax
    cmp dl,9
    je salir
    jmp multiplicar

salir:
 mov eax, 1
 int 80h
