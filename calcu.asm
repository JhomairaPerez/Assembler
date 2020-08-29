;Jhomaira Pérez
% macro escribir  2
    mov eax , 4
    mov ebx , 1
    mov ecx , % 1
    mov edx , % 2
    int 80h
% endmacro
% macro leer  2
    mov eax , 3
    mov ebx , 0
    mov ecx , % 1
    mov edx , % 2
    int 80h
% endmacro

section .data
	msg1		db		10,'-Calculadora-',10,0
	lmsg1		equ		$ - msg1

	mensajeopcion db 10,"**Menu **" ,10 , "1=> Sumar", 10 , "2=> Restar",10 , "3=> Multiplicar" ,10, "4=> Dividir" ,10,"5=> Salir",10, "Elija una opcion:"
  tamanoopcion equ $ - mensajeopcion

	msg2		db		10,'Numero 1: ',0
	lmsg2		equ		$ - msg2

	msg3		db		'Numero 2: ',0
	lmsg3		equ		$ - msg3

	msg4		db		10,'1.- Sumar: ',0
	lmsg4		equ		$ - msg4

	msg5		db		10,'2.- Restar: ',0
	lmsg5		equ		$ - msg5

	msg6		db		10,'3.- Multiplicar: ',0
	lmsg6		equ		$ - msg6

	msg7		db		10,'4.- Dividir: ',0
	lmsg7 	equ		$ - lmsg7

	msg11		db		10,'5.- Salir: ',0
	lmsg11		equ		$ - msg11


	msg9		db		10,'Resultado: ',0
	lmsg9		equ		$ - msg9

	msg10		db		10,'Opcion Invalida',10,0
	lmsg10		equ		$ - msg10

	nlinea		db		10,10,0
	lnlinea		equ		$ - nlinea

section .bss
		opcion resb 2
  	num1:		resb	2
		num2:		resb 	2
		resultado:	resb 	2

section .text
 	global _start

_start:


; ********************************
menu:
            escribir mensajeopcion, tamanoopcion

            leer opcion, 2
            mov ah, [opcion]
            sub ah, '0'

						cmp ah, 1
						je sumar

						cmp ah, 2
						je restar

						cmp ah, 3
						je multiplicar

						cmp ah, 4
						je dividir

						cmp ah, 5
						je salir


 sumar:
	; Movemos los numeros ingresados a los registro AL y BL
	mov al, [num1]
	mov bl, [num2]

	; Convertimos los valores ingresados de ascii a decimal
	sub al, '0'
	sub bl, '0'

	; Sumamos el registro AL y BL
	add al, bl
;	aaa

	; Convertimos el resultado de la suma de decimal a ascii
	add al, '0'

	; Movemos el resultado a un espacio reservado en la memoria
	mov [resultado], al

	; Imprimimos en pantalla el mensaje 9
	mov eax, 4
	mov ebx, 1
	mov ecx, msg9
	mov edx, lmsg9
	int 80h

	; Imprimimos en pantalla el resultado
	mov eax, 4
	mov ebx, 1
	mov ecx, resultado
	mov edx, 2
	int 80h

	jmp salir


restar:
	; Movemos los numeros ingresados a los registro AL y BL
	mov al, [num1]
	mov bl, [num2]

	; Convertimos los valores ingresados de ascii a decimal
	sub al, '0'
	sub bl, '0'

	; Restamos el registro AL y BL
	sub al, bl

	; Convertimos el resultado de la resta de decimal a ascii
	add al, '0'

	; Movemos el resultado a un espacio reservado en la memoria
	mov [resultado], al

	; Imprimimos en pantalla el mensaje 9
	mov eax, 4
	mov ebx, 1
	mov ecx, msg9
	mov edx, lmsg9
	int 80h

	; Imprimimos en pantalla el resultado
	mov eax, 4
	mov ebx, 1
	mov ecx, resultado
	mov edx, 1
	int 80h

	jmp salir


multiplicar:

	; Movemos los numeros ingresados a los registro AL y BL
	mov al, [num1]
	mov bl, [num2]

	; Convertimos los valores ingresados de ascii a decimal
	sub al, '0'
	sub bl, '0'

	; Multiplicamos. AX = AL X BL
	mul bl

	; Convertimos el resultado de la resta de decimal a ascii
	add ax, '0'

	; Movemos el resultado a un espacio reservado en la memoria
	mov [resultado], ax

	; Imprimimos en pantalla el mensaje 9
	mov eax, 4
	mov ebx, 1
	mov ecx, msg9
	mov edx, lmsg9
	int 80h

	; Imprimimos en pantalla el resultado
	mov eax, 4
	mov ebx, 1
	mov ecx, resultado
	mov edx, 1
	int 80h

	jmp salir


dividir:

	; Movemos los numeros ingresados a los registro AL y BL
	mov al, [num1]
	mov bl, [num2]

	; Igualamos a cero los registros DX y AH
	mov dx, 0
	mov ah, 0

	; Convertimos los valores ingresados de ascii a decimal
	sub al, '0'
	sub bl, '0'

	; Division. AL = AX / BL. AX = AH:AL
	div bl

	; Convertimos el resultado de la resta de decimal a ascii
	add ax, '0'

	; Movemos el resultado a un espacio reservado en la memoria
	mov [resultado], ax

	; Print on screen the message 9
	mov eax, 4
	mov ebx, 1
	mov ecx, msg9
	mov edx, lmsg9
	int 80h

	; Imprimimos en pantalla el resultado
	mov eax, 4
	mov ebx, 1
	mov ecx, resultado
	mov edx, 1
	int 80h

	jmp salir


salir:
	; Imprimimos en pantalla dos nuevas lineas
	mov eax, 4
	mov ebx, 1
	mov ecx, nlinea
	mov edx, lnlinea
	int 80h

	; Finalizamos el programa
	mov eax, 1
	mov ebx, 0
	int 80h
