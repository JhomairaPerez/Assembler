;Jhomaira Pérez
;Programa que realiza las operaciones basicas(suma,resta, multiplicacion y division) de dos números estaticos no se ingresara por teclado

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

    mensajee db "**Operacion de suma de 8 bits**",10
    tam equ $ - mensajee

    mensajeee db 10, "El resultado es: "
    taman equ $ - mensajeee

    mensajeresta db 10, "**Operacion de resta de 8 bits**",10
    tamresta equ $ - mensajeresta

    mensajerestaa db 10, "El resultado es: "
    tamanioresta equ $ - mensajerestaa

    mensaje0 db 10, "**Operacion de multiplicacion de 8 bits**",10
    tamanio equ $ - mensaje0

    mensaje01 db 10, "El resultado es: "
    tamanio2 equ $ - mensaje01

    mensaje1 db 10, "**Operacion de division de 8 bits**",10
    len1 equ $ - mensaje1

    mensaje2 db 10, "El cociente es: "
    len2 equ $ - mensaje2
    mensaje3 db 10, "El residuo es : "
    len3 equ $ - mensaje3

    new_line db 10, " "

section .bss
    suma resb 1
    resta resb 1
    resul resb 1
    residuo resb 1
    cociente resb 1

section .text
    global _start

_start:

;SUMA *************
    mov eax, 4
    mov ebx, 2
    add eax, ebx
    add eax, '0'

    mov [suma], eax

;RESTA********************
    mov eax,4
    mov ebx,2
    sub eax, ebx
    add eax, '0'

    mov [resta], eax
;MULTIPLICACION **************
    mov al, 4
    mov bl, 2
    mul bl
    add al, '0'
    mov [resul], al

;DIVISION ***************
    mov al, 4
    mov bl, 2
    div bl
    add al, '0'
    mov [cociente], al
    add ah, '0'
    mov [residuo], ah

;Resultado suma *******************
    escribir mensajee, tam
    escribir mensajeee, taman
    escribir suma, 1

;Resultado resta ****************
    escribir mensajeresta, tamresta
    escribir mensajerestaa, tamanioresta
    escribir resta, 1

;Resultado multiplicacion *******************
    escribir mensaje0, tamanio
    escribir mensaje01, tamanio2
    escribir resul, 1

;cociente*******************
    escribir mensaje1, len1
    escribir mensaje2, len2
    escribir cociente, 1

;residuo*******************
    escribir mensaje3, len3
    escribir residuo, 1

;Salida
    escribir new_line, 1
    mov eax, 1
    int 80h
