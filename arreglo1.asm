;JhomairaPerez
;03-08-2020
;Arreglo uso

section .data

    arreglo db 3,2,0,7,5
    len_arreglo equ $-arreglo

    new_line db 10,''

section .bss

  numero resb 1

section .text
    global _start

_start:

  mov esi, arreglo ;esi = fijar el tamaño del arreglo, posicionar el arreglo en memoria
  mov edi, 0       ;edi = contener el indice del arreglo

imprimir:


  mov al, [esi]
  add al, '0'
  mov [numero], al

  add esi, 1
  add edi, 1

  mov eax, 4
  mov ebx, 1
  mov ecx, numero
  mov edx, 1
  int 80h

  mov eax, 4
  mov ebx, 1
  mov ecx, new_line
  mov edx, 1
  int 80h

  cmp edi, len_arreglo  ;cmp 3, 4 => se activa carry
                        ;cmp 4, 3 => se desactiva carry  y zero
                        ;cmp 3, 3 => se desactiva carry  y zero se activa
  jb imprimir           ; se ejecuta cuando la bandera de carry esta activada

salir:

  mov eax, 1
  int 80h
