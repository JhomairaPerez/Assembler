%macro lee 1
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, 1
    int 80H
%endmacro

section .data
    enterr db 10, " "
    asterisco db "*"

section .text
    global _start
_start:
        mov edx, 9      ;filas
        mov ecx, 9      ;columnas

principal:
        push edx
        cmp edx, 0
        ;pop rbx
        jz salir
        jmp imp_columna

imp_columna:
        dec ecx
        push ecx
        lee asterisco
        pop ecx
        cmp ecx, 0
        jg imp_columna    ;verifica si el primer operando es mayor al sefundo operando/ tambien se puede usar ja para verificar si es diferente de 0
        lee enterr
        pop edx
        dec edx
        mov ecx, 9
        jmp principal

salir:
        mov eax, 1
        int 80h
