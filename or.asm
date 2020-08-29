section .data
  msj db "Par",10
  len equ $-msj
  msj2 db "Impar",10
  len2 equ $-msj2

section .bss
;  result resb 2
section .text
   global _start

_start:

  ;mov    al, 5
  ;mov    bl, 3            
  ;or     al, bl
  ;add    al, '0'

  ;mov    [result],  al
  ;mov    eax, 4
  ;mov    ebx, 1
  ;mov    ecx, result
  ;mov    edx, 1
  ;int    0x80
  ;
   mov al, 5;0010
   test al, 01h
   jz esPar
   jnz esImpar

esPar:
   mov eax, 4
   mov ebx, 1
   mov ecx, msj
   mov edx, len
   int 80h
   jmp salir

esImpar:
    mov eax, 4
    mov ebx, 1
    mov ecx, msj2
    mov edx, len2
    int 80h

salir:
    mov eax, 1
    int 80h
