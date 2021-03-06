;JhomairaPerez
;13-07-2020
;6to
;Calculadora con menu

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
    mens db 'Numero 1: ',10
    len equ $ - mens
    mensaje db 'Numero 2: ',10
    lenn equ $ - mensaje

    mensajeopcion db 10,"Menu" ,10 , "1=> Sumar", 10 , "2=> Restar",10 , "3=> Multiplicar" ,10, "4=> Dividir" ,10, "5=> Salir", 10, "Elija una opcion:"
    tamanoopcion equ $ - mensajeopcion

    mensajee db 10,"SUMA"
    tam equ $ - mensajee

    mensajeee db 10, "El resultado es: "
    taman equ $ - mensajeee

    mensajeresta db 10, "RESTA"
    tamresta equ $ - mensajeresta

    mensajerestaa db 10, "El resultado es: "
    tamanioresta equ $ - mensajerestaa

    mensaje0 db 10, "MULTIPLICACION"
    tamanio equ $ - mensaje0

    mensaje01 db 10, "El resultado es: "
    tamanio2 equ $ - mensaje01

    mensaje1 db 10, "DIVISION"
    len1 equ $ - mensaje1

    mensaje2 db 10, "El cociente es: "
    len2 equ $ - mensaje2
    mensaje3 db 10, "El residuo es : "
    len3 equ $ - mensaje3

    new_line db 10, " "

section .bss
    n1 resb 1
    n2 resb 1
    opcion resb 1
    suma resb 1
    resta resb 1
    resul resb 1
    residuo resb 1
    cociente resb 1

section .text
    global _start

_start:

;************numero 1*************
    escribir mens, len
    leer n1, 2
    mov al, [n1]
    sub al, '0'

;************numero 2*************
    escribir mensaje, lenn
    leer n2, 2
    mov ah, [n2]
    sub ah, '0'

; ********************************
menu:
            escribir mensajeopcion, tamanoopcion

            leer opcion, 2
            mov bl, [opcion]
            sub bl, '0'

            cmp bl, 1
            je sumar

            cmp bl, 2
            je restar

            cmp bl, 3
            je multiplicar

            cmp bl, 4
            je dividir

            cmp bl, 5
            je salir


            ;jmp dividir
;***********proceso Suma *************
sumar:
            mov eax,[n1]
            mov ebx,[n2]
            sub eax, '0'
            sub ebx, '0'
            add eax, ebx
            add eax, '0'

            mov [suma], eax

            ;imprimir suma
            escribir mensajee, tam
            escribir mensajeee, taman
            escribir suma, 1

            jmp menu

;***********proceso resta********************
restar:
            mov eax,[n1]
            mov ebx,[n2]
            sub eax, '0'
            sub ebx, '0'
            sub eax, ebx
            add eax, '0'

            mov [resta], eax

            ;imprimir resta
            escribir mensajeresta, tamresta
            escribir mensajerestaa, tamanioresta
            escribir resta, 1

            jmp menu

;***********proceso Multiplicacion **************
multiplicar:
            mov al, [n1]
            mov bl, [n2]
            sub al, '0'
            sub bl, '0'
            mul bl
            add al, '0'
            mov [resul], al

            ;imprimir multiplicacion
            escribir mensaje0, tamanio
            escribir mensaje01, tamanio2
            escribir resul, 1

            jmp menu

;***********proceso Division ***************
dividir:
            mov al, [n1]
            mov bl, [n2]
            sub al, '0'
            sub bl, '0'
            div bl
            add al, '0'
            mov [cociente], al
            add ah, '0'
            mov [residuo], ah

            ;cociente
            escribir mensaje1, len1
            escribir mensaje2, len2
            escribir cociente, 1

            ;residuo
            escribir mensaje3, len3
            escribir residuo, 1

            jmp menu

;************final************************
salir:
            escribir new_line, 1
            mov eax, 1
            int 80h
