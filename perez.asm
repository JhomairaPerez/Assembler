;Jhomaira Perez
;6 to "A"
;26-08-2020
;Tema 4
%macro escribir 2
    mov eax, 4
  	mov ebx, 1
  	mov ecx, %1
  	mov edx, %2
  	int 80h
%endmacro

section .data
    msj db "Ingrese hasta 10 vocales",10
    len equ $-msj

    msjres db "la vocal que menos se repite es: "
    lenres equ $-msjres

    msj_respuesta db "  =   veces"
    len_respuesta equ $-msj_respuesta

    arreglo db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    len_arreglo equ $ - arreglo

    new_line db "",10

    path db "/home/jhomaira/Escritorio/Prueba/resultados.txt", 0
    pathwrite db "/home/jhomaira/Escritorio/Prueba/datos.txt", 0

section .bss
    idarchivo resd 1
    idarchivowrite resd 1
    idarchivowrite2 resd 1
    cont resb 10
    menor resb 1

section .text
    global _start

_start:

    ; ----------------- Escribir -------------------

    ;*******Imprimir primer mensaje****
    escribir msj, len
    ;********Se ingresa por teclado
    mov eax, 03
    mov ebx, 02
    mov ecx, arreglo
    mov edx, 345
    int 80h


    mov eax, 8 ;crear y escribir archivo
    mov ebx, pathwrite
    mov ecx, 2
    mov edx, 200h
    int 0x80

    test eax, eax
    jz salir


    mov dword [idarchivowrite], eax

    ;*******escribir texto en el archivo
    mov eax, 4
    mov ebx, [idarchivowrite]
    mov ecx, arreglo
    mov edx, len_arreglo
    int 80h
    ; ------ Fin --------------------

    mov eax, 5 ;servicio para abrir el archivo
    mov ebx, pathwrite ;servicio de direccion del archivo
    mov ecx, 0
    mov edx, 0
    int 0x80
    ;verificamos si el path es correcto o si existe
    test eax, eax
    jz salir

    mov dword [idarchivo], eax

    mov eax, 3
    mov ebx, [idarchivo]
    mov ecx, arreglo
    mov edx, len_arreglo
    int 80H

    ; ----------------- crear archivo ressultado -------------------

    mov eax, 8 ;crear y escribir archivo
    mov ebx, path
    mov ecx, 2
    mov edx, 200h
    int 0x80

    test eax, eax
    jz salir


    mov dword [idarchivowrite2], eax
    ;----------------------------

    mov ah, 0
    add ah, '0'
    mov [cont],ah

    mov ecx, 10
    mov esi, 0

loop1:
    push ecx

    mov al, [arreglo+esi]
    sub al, '0'

    inc esi
    push esi

    mov esi, 0
    mov ecx, 10

    call loop2

    add al, '0'
    mov [msj_respuesta+ 3], dword al

    mov ah, [cont]
    mov [msj_respuesta+ 4], dword ah


    call escribir_texto
    ;reinicio el contador en 0
    mov ah, 0
    add ah, '0'
    mov [cont],ah

    pop esi
    pop ecx
    loop loop1
    jmp auxx

loop2:
    mov dl, [arreglo+esi]
    sub dl, '0'
    inc esi

    cmp al, dl
    jz inc_cont
endl2:
    loop loop2
    ret

inc_cont:
    mov bl, [cont]
    sub bl, '0'
    inc bl
    add bl, '0'
    mov [cont], bl
    jmp endl2

auxx:
    mov dl, [esi]
    mov [menor], dl
    jmp verMenor

verMenor:
    mov dl, [esi]
    add esi, 1
    add edi, 1

    mov dl, [menor]

    cmp dl, al
    jb  numeroMenor
    jmp compararMenor

numeroMenor:
    mov [menor],dl
    jmp respuesta

compararMenor:
    cmp edi, len_arreglo
    jb verMenor

    mov esi, arreglo
    mov edi, 0
    jmp respuesta

escribir_texto:
    mov eax, 4
    mov ebx, [idarchivowrite2]
    mov ecx, msj_respuesta
    mov edx, len_respuesta
    int 80H
    ret

respuesta:
    mov eax, [menor]
    add eax, '0'
    mov [menor], eax

    mov eax, 4
    mov ebx, [idarchivowrite2]
    mov ecx, new_line
    mov edx, 1
    int 80H

    mov eax, 4
    mov ebx, [idarchivowrite2]
    mov ecx, msjres
    mov edx, lenres
    int 80H

    mov eax, 4
    mov ebx, [idarchivowrite2]
    mov ecx, menor
    mov edx, 1
    int 80H

    jmp cerrarArchivo

cerrarArchivo:
    ;*****   cerrar del archivo ***********************
    mov eax, 6
    mov ebx, [idarchivo]
    mov ecx, 0
    mov edx, 0
    int 0x80

salir:
    mov eax, 1
    mov ebx, 0
    int 80H
