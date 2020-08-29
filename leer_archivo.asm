;Jhomaira Perez
;6to "A"
;Escribir archivo2
%macro escribir 2
        mov eax, 4
        mov ebx, 1
        mov ecx, %1
        mov edx, %2
        int 80h
%endmacro
section .data
		msj1 db  "Ingrese datos en el archivo", 10
		len1 equ $ - msj1

		archivo db "/home/jhomaira/Escritorio/ar.txt", 0


section .bss
		texto resb 30
		idarchivo resd 1

section .text
		global _start

_start:

;abrir el archivo **************************
		mov eax, 5         ; servicio para crear archivos, trabajar con archivos ; operacion de open
		mov ebx, archivo   ;direccion del archivo
		mov ecx, 0         ;modo de acceso
    mov edx, 777h
    int 80h


    test eax, eax
    jz salir             ;se ejecuta cuando existen errores en el archivo


    mov dword[idarchivo], eax
    escribir msj1, len1
;leer el acrhivo ********************

    mov eax, 3
    mov ebx, [idarchivo]
    mov ecx, texto
    mov edx, 15
    int 80h

    escribir texto, 15

;escritura en el archivo ***********
    mov eax, 4
    mov ebx, [idarchivo]
    mov ecx, 0
    mov edx, 0
    int 80h

salir:

    mov eax, 1
    int 80h

; cat ar
; cat archivo.txt
; chmod 777 ar
; sudo cat archivo.txt
