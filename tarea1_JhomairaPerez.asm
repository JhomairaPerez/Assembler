Comentar el significado de cada línea
;Jhomaira Perez


;declaramos el macro, se llama imprimir y el parámetro es 2
%macro imprimir 2	
	mov eax,4 ;Cargamos subrutina de escritura  
	mov ebx,1 ;ubidad de salida standar 
	mov ecx,%1 ;alamcena el parametro del mensaje
	mov edx,%2	;se imprime el número de caracteres
	int 80H
%endmacro
;Fin macro

;declaramos el macro, se llama leer y el parámetro es 2
%macro leer 2
    mov eax,3 ;Cargamos subrutina de lectura 
    mov ebx,0 ;operacion standar de entrada  
    mov ecx,%1 ;alamcena el parametro del mensaje
    mov edx,%2 ;se imprime el número de caracteres
    int 80H
%endmacro
;Fin macro

; ecx,modo de acceso
; edx, permisos
section .bss ;Para variables
	auxiliar resb 30 ;reserva espacio de 30 byte en la variable auxiliar
	auxiliarb resb 30 ;reserva espacio de 30 byte en la variable auxiliarb
	auxiliarc resb 30 ;reserva espacio de 30 byte en la variable auxiliarc


section .data ;Para constantes
	msg db 0x1b ,"       " ; 6 espacios para contener al dato
	lenmsg equ $-msg ;Calcula el tamaño del mensaje



	salto db " ",10 ; 
	lensalto equ $-salto




section .text ;sección en la que se incluyen las instrucciones del programa.
    global _start

_start:

	mov ecx,9  ;realiza un movimiento directo al registro ecx, se mueve 9 decimal al registro ecx

	mov al,0 ;realiza un movimiento directo al registro al, se mueve 0 decimal al registro al
	mov [auxiliar],al

cicloI:
	push ecx
	mov ecx,9

	mov al,0
	mov [auxiliarb],al

	cicloJ:
		push ecx ;guarda el valor de ecx en la pila (opereando fuente)


		call imprimir0al9 ;llama a la subrutina imprimir0al9


	;	imprimir msg2,lenmsg2

	fincicloJ:
		mov al,[auxiliarb]
		inc al ; incrementa cl 
		mov [auxiliarb],al

		pop ecx ;almacena en ecx el valor que se encuentra en la cima de la pila (operando destino)
		loop cicloJ ; realiza un bucle  en la etiqueta cicloJ

	;imprimir salto,lensalto

fincicloI:
	mov al,[auxiliar] ; realiza un movimiento donde alamacena la variable auxiliar que esta en momoria al registro al
	inc al ; incrementa al 
	mov [auxiliar],al ; realiza un movimiento del registro al a la variable auxiliar que esta en momoria

	pop ecx ;almacena en ecx el valor que se encuentra en la cima de la pila (operando destino)
	loop cicloI ;realiza un bucle en la etiqueta cicloI


salir:
	mov eax, 1 ;salida del proceso actual 
	int 80H	;la interrupcion envia una señal al SO para ejecutar una subrutina(operacion o funcion)



imprimir0al9:

	mov ebx,"["
	mov [msg+1], ebx

	mov bl,[auxiliar] ;realiza un movimiento donde alamacena la variable auxiliar que esta en momoria al registro bl
	add bl,'0' ;transforma de cadena  a numero
	mov [msg+2], bl ;realiza un movimiento del registro bl a la variable auxiliar que esta en momoria mas 2 espacios, diriecccionamiento a la base 


	mov ebx,";"
	mov [msg+3], ebx


	mov bl,[auxiliarb] ;realiza un movimiento donde alamacena la variable auxiliarb que esta en momoria al registro bl
	add bl,'0' ;transforma de cadena  a numero
	mov [msg+4],bl

	mov ebx,"fJ"
	mov [msg+5], ebx

	imprimir msg,lenmsg ; llama al macro de imprimir y alamacena el mensaje y el numero de caracteres 

	ret ;retorno de subrutina
