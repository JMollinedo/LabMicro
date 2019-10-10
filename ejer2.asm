.MODEL SMALL
.DATA
    num1 DB ? ;variable num1 no asignado
    num2 DB ? ;variable num2 no asignado
    tins DB 'INGRESAR DIGITO$'
    tfir DB 'EL PRIMER NUMERO ES MAYOR$'
    tseg DB 'EL SEGUNDO NUMERO ES MAYOR$'
    tequ DB 'SON IGUALES$'
.STACK
.CODE
programa:
    MOV AX , @DATA
    MOV DS , AX
    JMP main
fin:
    MOV AH , 4Ch
    INT 21h
main:
    ;ingresar num1
    XOR DX , DX ;limpiar registro
    MOV DX , OFFSET tins
    MOV AH , 09h ;imprimir texto
    INT 21h
    
    MOV DL , 13 ;char fin de linea
    MOV AH , 02h ;imprimir char
    INT 21h
    MOV DL , 10 ;char fin de linea
    MOV AH , 02h ;imprimir char
    INT 21h
    
    MOV AH , 01h ;AL = teclado
    INT 21h
    SUB AL , 30h ;ascii -> digito
    MOV num1 , AL ; num1 = AL
    
    MOV DL , 13 ;char fin de linea
    MOV AH , 02h ;imprimir char
    INT 21h
    MOV DL , 10 ;char fin de linea
    MOV AH , 02h ;imprimir char
    INT 21h
    
    ;ingresar num2
    XOR DX , DX ;limpiar registro
    MOV DX , OFFSET tins
    MOV AH , 09h ;imprimir texto
    INT 21h
    
    MOV DL , 13 ;char fin de linea
    MOV AH , 02h ;imprimir char
    INT 21h
    MOV DL , 10 ;char fin de linea
    MOV AH , 02h ;imprimir char
    INT 21h
    
    MOV AH , 01h ;AL = teclado
    INT 21h
    SUB AL , 30h ;ascii -> digito
    MOV num2 , AL ; num1 = AL
    
    MOV DL , 13 ;char fin de linea
    MOV AH , 02h ;imprimir char
    INT 21h
    MOV DL , 10 ;char fin de linea
    MOV AH , 02h ;imprimir char
    INT 21h
    
    XOR BX , BX
    MOV BH , num1
    MOV BL , num2
    
    CMP BL , BH
    JS uno
    JG dos
    
    XOR DX , DX ;limpiar registro
    MOV DX , OFFSET tequ
    MOV AH , 09h ;imprimir texto
    INT 21h
    
    JMP fin
uno:
    XOR DX , DX ;limpiar registro
    MOV DX , OFFSET tfir
    MOV AH , 09h ;imprimir texto
    INT 21h
    JMP fin
dos:
    XOR DX , DX ;limpiar registro
    MOV DX , OFFSET tseg
    MOV AH , 09h ;imprimir texto
    INT 21h
    JMP fin
END programa