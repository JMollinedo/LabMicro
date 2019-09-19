.MODEL small

.DATA	;opcional, variable que contiene el texto que queremos mostrar
nombre DB 'Javier Mollinedo$' ;$ significa final de cadena
carnet DB '1062217$'
;DB -> doble byte


.STACK ;opcional

.CODE
programa: ;etiqueta de inicio de programa
	;inicializar programa
	MOV AX, @DATA ;guardando direccion de inicio segmento de datos
	MOV DS, AX
	;imprimir cadena
	MOV DX, OFFSET nombre	;asignando a DX la variable nombre
	MOV AH, 09h				;imprime la cadena
	INT 21h					;ejecuta el codigo anterior
	;imprimir caracter
	MOV DX, 0000h			;limpiar el registro
	MOV DL, 9				;asignando a DL el caracter TAB
	MOV AH, 02h				;imprime caracter
	INT 21h					;ejecuta el codigo anterior
	;imprimir cadena
	XOR DX, DX				;limpiar el registro
	MOV DX, OFFSET carnet	;asignando a DX la variable carnet
	MOV AH, 09h				;imprime la cadena
	INT 21h					;ejecuta el codigo anterior
	;finalizar programa
	MOV AH, 4Ch ;finaliza proceso
	INT 21h ;ejecuta interrupcion
END programa
