%macro write 2
  mov eax, 4
  mov ebx, 1
  mov ecx, %1
  mov edx, %2
  int 80h
%endmacro

%macro read 2
  mov eax, 3
  mov ebx, 0
  mov ecx, %1
  mov edx, %2
  int 80h
%endmacro

section .data
    msj db "Ingrese hasta 10 vocales",10
    len equ $-msj

    pathDes db '/home/jhomaira/Escritorio/Prueba/array.txt',0
    newLine db '',10

    mjsModa db 'La moda es: '
    lenModa equ $ -mjsModa

    mjsCont db 'Se repite: '
    lenCont equ $ -mjsCont

    mjsSomething db ' veces',10
    lenSomething equ $ -mjsSomething


    ;Dfenir arreglo
    array db 0,0,0,0,0,0,0,0
    lenArray equ $ -array

section .bss
    idArray resd 1
    idarchivo resd 1
    ; variables moda
    aux resd 1
    value resd 1
    cont resd 1
section .text
    global _start
_start:


    ; ----------------- Escribir -------------------

    ;*******Imprimir primer mensaje****
    escribir msj, len
    ;********Se ingresa por teclado
    mov eax, 03
    mov ebx, 02
    mov ecx, array
    mov edx, 345
    int 80h


    mov eax, 8 ;crear y escribir archivo
    mov ebx, pathDes
    mov ecx, 2
    mov edx, 200h
    int 0x80

    test eax, eax
    jz salir


    mov dword [idArray], eax

    ;*******escribir texto en el archivo
    mov eax, 4
    mov ebx, [idArray]
    mov ecx, array
    mov edx, lenArray
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

    mov dword [idArray], eax

    mov eax, 3
    mov ebx, [idArray]
    mov ecx, array
    mov edx, lenArray

    ;write array,lenArray
    ;write newLine,1

    ; close file 1
    mov eax, 6
    mov ebx, [idArray]
    mov ecx, 0
    mov edx, 0x1FF
    int 80h


initModa:
    mov esi, array
    mov edi, 0

    mov eax, [esi]
    mov [aux], eax

    mov bl, 0
    mov [cont], bl

    mov cl, 0

    mov dl, 0

findModa:
    mov al, [aux]
    mov bl, [esi]

    call compareModa

    inc esi
    inc edi
    cmp edi, lenArray
    jb findModa
    jmp compareEndArray

compareModa:
    cmp al, bl
    je incrementCont
    ret
incrementCont:
    inc cl
    ret
compareEndArray:
    inc dl
    mov al, dl
    mov esi, array
    mov edi, 0
    call seePosition
    call compareCont
    mov al, [esi]
    mov [aux], al

    mov cl, 0

    cmp dl, lenArray
    jb findModa
    jmp printResult
seePosition:
    inc esi
    inc edi
    dec al
    cmp al, 0
    jg seePosition
    ret
compareCont:
    cmp cl, [cont]
    jg modaMore
    ret
modaMore:
    mov al, [aux]
    mov [value], al
    mov [cont], cl
    ret

printResult:
    write mjsModa, lenModa
    write value, 1
    write newLine, 1

    write mjsCont, lenCont
    mov cl, [cont]
    add cl, '0'
    mov [cont], cl
    write cont, 1
    write mjsSomething, lenSomething

salir:
    mov eax, 1
    int 80h
