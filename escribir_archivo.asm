;Jhomaira Perez
;6to "A"
;Escribir archivo
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


leer:

    mov eax, 3
    mov ebx, 0
    mov ecx, texto
    mov edx, 10
    int 80h
    ret

_start:

		mov eax, 8         ; servicio para crear archivos, trabajar con archivos
		mov ebx, archivo   ;direccion del archivo
		mov ecx, 1         ;modo de acceso
                            ;O-RDONLY 0: El archivo se abre solo para leer
                            ;O-WRONLY 1: El archivo se abre para escritura
                            ;O-RDWR 2: El archivo se abre para escritura y lectura
                            ;O-CREATE 256: Crea el archivo en caso de que no exista
                            ;O-APPEND 200h: El archivo se abre solo para escritura al final

    mov edx, 777h
    int 80h


    test eax, eax        ;instruccion de comparacion  realiza la operacion logica 'y' de dos operandos
                        ;pero no afecta a ninguno de ellos, SOLO afecta al registro de estado. Admite
                        ;todos los tipos de direccionamiento excepto los dos operandos de memoria
                              ; TEST reg, reg
                              ; TEST reg, memoria
                              ; TEST memoria, reg
                              ; TEST reg, inmediato
                              ; TEST memoria, inmediato

    jz salir             ;se ejecuta cuando existen errores en el archivo

    escribir msj1, len1
    mov dword[idarchivo], eax
    call leer

    ;**************escritura en el archivo ***********
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
