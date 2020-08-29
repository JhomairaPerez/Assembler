;JhomairaPerez
;05-08-2020
;TABLAS DE MULTILCAR hasta el 9, utilizando call
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
    men db "1 "
    men2 db "2 "
    men3 db "3 "
    men4 db "4 "
    men5 db "5 "
    men6 db "6 "
    men7 db "7 "
    men8 db "8 "
    men9 db "9 "
    newLine db 10
    lennewLine equ $- newLine
    asterisco db ' * '
    len_asterisco equ $- asterisco
    msjIgual db ' = '
section .bss
    dlIn resb 2
    r resb 2
    r2 resb 2
    r3 resb 2
    r4 resb 2
    r5 resb 2
    r6 resb 2
    r7 resb 2
    r88 resb 2
    r99 resb 2
section .text
    global _start
_start:

    mov al, 1
    mov dl,0

multiplicar1:
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

    call imprimirMensajes1
    call imprimirMensajes
    call imprimirMensajesResul1

    pop edx
    pop eax
    cmp dl,9
    je multiplicar2_aux
    jmp multiplicar1
;*******************************************************
multiplicar2_aux
    mov al, 2
    mov dl,0

multiplicar2:
    inc dl
    push eax
    push edx
    mul dl

    ;convertir
    add eax, '0'
    mov [r2], eax

    ;Obtener el valor del incremento
    mov ax,dx
    add ax, '0'
    mov [dlIn], ax

    call imprimirMensajes2
    call imprimirMensajes
    call imprimirMensajesResul2

    pop edx
    pop eax
    cmp dl,9
    je multiplicar3_aux
    jmp multiplicar2

;***********************************************************
multiplicar3_aux
    mov al, 3
    mov dl,0

multiplicar3:
    inc dl
    push eax
    push edx
    mul dl

    ;convertir
    add eax, '0'
    mov [r3], eax

    ;Obtener el valor del incremento
    mov ax,dx
    add ax, '0'
    mov [dlIn], ax

    call imprimirMensajes3
    call imprimirMensajes
    call imprimirMensajesResul3

    pop edx
    pop eax
    cmp dl,9
    je multiplicar4_aux
    jmp multiplicar3
;****************************************************************

multiplicar4_aux
    mov al, 4
    mov dl,0

multiplicar4:
    inc dl
    push eax
    push edx
    mul dl

    ;convertir
    add eax, '0'
    mov [r4], eax

    ;Obtener el valor del incremento
    mov ax,dx
    add ax, '0'
    mov [dlIn], ax

    call imprimirMensajes4
    call imprimirMensajes
    call imprimirMensajesResul4

    pop edx
    pop eax
    cmp dl,9
    je multiplicar5_aux
    jmp multiplicar4
;******************************************************

multiplicar5_aux
    mov al, 5
    mov dl,0

multiplicar5:
    inc dl
    push eax
    push edx
    mul dl

    ;convertir
    add eax, '0'
    mov [r5], eax

    ;Obtener el valor del incremento
    mov ax,dx
    add ax, '0'
    mov [dlIn], ax

    call imprimirMensajes5
    call imprimirMensajes
    call imprimirMensajesResul5

    pop edx
    pop eax
    cmp dl,9
    je multiplicar6_aux
    jmp multiplicar5
;********************************************************
multiplicar6_aux
    mov al, 6
    mov dl,0

multiplicar6:
    inc dl
    push eax
    push edx
    mul dl

    ;convertir
    add eax, '0'
    mov [r6], eax

    ;Obtener el valor del incremento
    mov ax,dx
    add ax, '0'
    mov [dlIn], ax

    call imprimirMensajes6
    call imprimirMensajes
    call imprimirMensajesResul6

    pop edx
    pop eax
    cmp dl,9
    je multiplicar7_aux
    jmp multiplicar6

;***********************************************************
multiplicar7_aux
    mov al, 7
    mov dl,0

multiplicar7:
    inc dl
    push eax
    push edx
    mul dl

    ;convertir
    add eax, '0'
    mov [r7], eax

    ;Obtener el valor del incremento
    mov ax,dx
    add ax, '0'
    mov [dlIn], ax

    call imprimirMensajes7
    call imprimirMensajes
    call imprimirMensajesResul7

    pop edx
    pop eax
    cmp dl,9
    je multiplicar8_aux
    jmp multiplicar7
;****************************************************************

multiplicar8_aux
    mov al, 8
    mov dl,0

multiplicar8:
    inc dl
    push eax
    push edx
    mul dl

    ;convertir
    add eax, '0'
    mov [r88], eax

    ;Obtener el valor del incremento
    mov ax,dx
    add ax, '0'
    mov [dlIn], ax

    call imprimirMensajes8
    call imprimirMensajes
    call imprimirMensajesResul8

    pop edx
    pop eax
    cmp dl,9
    je multiplicar9_aux
    jmp multiplicar8
;******************************************************

multiplicar9_aux
    mov al, 9
    mov dl,0

multiplicar9:
    inc dl
    push eax
    push edx
    mul dl

    ;convertir
    add eax, '0'
    mov [r99], eax

    ;Obtener el valor del incremento
    mov ax,dx
    add ax, '0'
    mov [dlIn], ax

    call imprimirMensajes9
    call imprimirMensajes
    call imprimirMensajesResul9

    pop edx
    pop eax
    cmp dl,9
    je salir
    jmp multiplicar9
;********************************************************
imprimirMensajes1:
    escribir men,1
    ret

imprimirMensajes2:
    escribir men2,1
    ret

imprimirMensajes3:
    escribir men3,1
    ret
imprimirMensajes4:
    escribir men4,1
    ret
imprimirMensajes5:
    escribir men5,1
    ret
imprimirMensajes6:
    escribir men6,1
    ret

imprimirMensajes7:
    escribir men7,1
    ret

imprimirMensajes8:
    escribir men8,1
    ret

imprimirMensajes9:
    escribir men9,1
    ret


imprimirMensajes:
    escribir asterisco, len_asterisco
    escribir dlIn,2
    escribir msjIgual,3
    ret

imprimirMensajesResul1:
    escribir r, 2
    escribir newLine, lennewLine
    ret

imprimirMensajesResul2:
    escribir r2, 2
    escribir newLine, lennewLine
    ret
imprimirMensajesResul3:
    escribir r3, 2
    escribir newLine, lennewLine
    ret
imprimirMensajesResul4:
    escribir r4, 2
    escribir newLine, lennewLine
    ret
imprimirMensajesResul5:
    escribir r5, 2
    escribir newLine, lennewLine
    ret
imprimirMensajesResul6:
    escribir r6, 2
    escribir newLine, lennewLine
    ret
imprimirMensajesResul7:
    escribir r7, 2
    escribir newLine, lennewLine
    ret
imprimirMensajesResul8:
    escribir r88, 2
    escribir newLine, lennewLine
    ret
imprimirMensajesResul9:
    escribir r99, 2
    escribir newLine, lennewLine
    ret

salir:
 mov eax, 1
 int 80h
