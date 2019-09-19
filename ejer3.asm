.MODEL small

.DATA	;opcional, variable que contiene el texto que queremos mostrar
cad DB 'el simbolo escogido es:$' ;$ significa final de cadena
;DB -> doble byte


.STACK ;opcional

.CODE
programa: ;etiqueta de inicio de programa
	;inicializar programa
	MOV AX, @DATA ;guardando direccion de inicio segmento de datos
	MOV DS, AX
	;imprimir cadena
	MOV DX, OFFSET cad	;asignando a DX la variable cad
	MOV AH, 09h			;imprime la cadena
	INT 21h				;ejecuta el codigo anterior
	;imprimir caracter
	MOV DX, 0000h		;limpiar el registro
	MOV DL, 126			;asignando a DL el caracter ~
	MOV AH, 02h			;imprime caracter ~
	INT 21h				;ejecuta el codigo anterior
	;finalizar programa
	MOV AH, 4Ch ;finaliza proceso
	INT 21h ;ejecuta interrupcion
END programa