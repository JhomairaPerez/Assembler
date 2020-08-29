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
    msjN db "Ingrese un numero: "
    lenM equ $-msjN
    newLine db '',10
section .bss
    n resb 2
    dlIn resb 2
    r resb 2
section .text
    global _start
_start:
    escribir msjN, lenM
    leer n,2
    mov al, [n]
    sub al, '0'
    mov dl,1

multiplicar:
    inc dl
    push eax
    push edx
    mul dl

    add al, '0'
    mov [r], al

    pop edx
    pop eax
    cmp dl,[n]
    je resultado
    jmp multiplicar

resultado:
  escribir r, 2
  escribir newLine,1
