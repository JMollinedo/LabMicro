.MODEL small

.DATA   ;segmento de datos (variables)
    num1 DB ? ;variable num1, valor sin asignar
    num2 DB ? ;variable num2, valor sin asignar
    diez DB 10d
    tins DB 'INGRESE DIGITO$'
    tsum DB 'SUMA $' ;texto SUMA
    tres DB 'RESTA $' ;texto RESTA
    tmul DB 'MULTIPLICACION $' ;texto MULTIPLICACION
    tdiv DB 'DIVISION $' ;texto DIVISION
    trec DB 'RESIDUO $' ;texto RESIDUOS
.STACK ;segmento de pila
.CODE
programa: ;etiqueta de inicio de programa
    ;inicializar programa
    MOV AX , @DATA ;guardando direccion de inicio segmento de datos
    MOV DS , AX
    
    ;ingresar num1
    XOR DX , DX; limpiar registro
    MOV DX , OFFSET tins
    MOV AH , 09h ;imprimir texto
    INT 21h
    
    MOV DL , 13; char de fin de linea
    MOV AH, 02h  ;imprime caracter
    INT 21h
    
    MOV DL , 10; char de salto de linea
    MOV AH, 02h  ;imprime caracter
    INT 21h
    
    MOV AH , 01h;AL = teclado
    INT 21h
    SUB AL , 30h; ascii -> digito
    MOV num1 , AL
    
    MOV DL , 13; char de fin de linea
    MOV AH, 02h  ;imprime caracter
    INT 21h
    
    MOV DL , 10; char de salto de linea
    MOV AH, 02h  ;imprime caracter
    INT 21h
    
    ;ingresar num2
    XOR DX , DX; limpiar registro
    MOV DX , OFFSET tins
    MOV AH , 09h ;imprimir texto
    INT 21h
    
    MOV DL , 13; char de fin de linea
    MOV AH, 02h  ;imprime caracter
    INT 21h
    
    MOV DL , 10; char de salto de linea
    MOV AH, 02h  ;imprime caracter
    INT 21h
    
    MOV AH , 01h;AL = teclado
    INT 21h
    SUB AL , 30h; ascii -> digito
    MOV num2, AL
    
    MOV DL , 13; char de fin de linea
    MOV AH, 02h  ;imprime caracter
    INT 21h
    
    MOV DL , 10; char de salto de linea
    MOV AH, 02h  ;imprime caracter
    INT 21h
    
    ;suma
    XOR DX , DX; limpiar registro
    MOV DX , OFFSET tsum
    MOV AH , 09h ;imprimir texto
    INT 21h
    
    XOR AL , AL; limpiar registro
    MOV AL , num1; AL = num1
    ADD AL , num2; AL += num2
    XOR BX , BX
    MOV BL , AL
    
    ;
    XOR AX , AX; limpiar registro
    MOV AL , BL; AL = suma
    DIV diez; AL = AX / 10, AH = AX % 10
    XOR BX , BX
    MOV BX , AX; BX = AX
    
    MOV DL , BL
    ADD DL , 30h; numero -> ascii
    MOV AH , 02h  ;imprime caracter
    INT 21h
    
    MOV DL , BH
    ADD DL , 30h; numero -> ascii
    MOV AH , 02h  ;imprime caracter
    INT 21h
    ;
    
    MOV DL , 13; char de fin de linea
    MOV AH, 02h  ;imprime caracter
    INT 21h
    
    MOV DL , 10; char de salto de linea
    MOV AH, 02h  ;imprime caracter
    INT 21h
    
    ;resta
    XOR DX , DX; limpiar registro
    MOV DX , OFFSET tres
    MOV AH , 09h ;imprimir texto
    INT 21h
    
    XOR AL , AL; limpiar registro
    MOV AL , num1; AL = num1
    SUB AL , num2; AL -= num2
    XOR BX , BX
    MOV BL , AL
    
    ;
    XOR AX , AX; limpiar registro
    MOV AL , BL; AL = resta
    DIV diez; AL = AX / 10, AH = AX % 10
    XOR BX , BX
    MOV BX , AX; BX = AX
    
    MOV DL , BL
    ADD DL , 30h; numero -> ascii
    MOV AH , 02h  ;imprime caracter
    INT 21h
    
    MOV DL , BH
    ADD DL , 30h; numero -> ascii
    MOV AH , 02h  ;imprime caracter
    INT 21h
    ;
    
    MOV DL , 13; char de fin de linea
    MOV AH, 02h  ;imprime caracter
    INT 21h
    
    MOV DL , 10; char de salto de linea
    MOV AH, 02h  ;imprime caracter
    INT 21h
    
    ;multiplicacion
    XOR DX , DX; limpiar registro
    MOV DX , OFFSET tmul
    MOV AH , 09h ;imprimir texto
    INT 21h
    
    XOR AX , AX; limpiar registro
    MOV AL , num1; AL = num1
    MUL num2; AX = AL * num2
    XOR BX , BX
    MOV BL , AL
    
    ;
    XOR AX , AX; limpiar registro
    MOV AL , BL; AL = suma
    DIV diez; AL = AX / 10, AH = AX % 10
    XOR BX , BX
    MOV BX , AX; BX = AX
    
    MOV DL , BL
    ADD DL , 30h; numero -> ascii
    MOV AH , 02h  ;imprime caracter
    INT 21h
    
    MOV DL , BH
    ADD DL , 30h; numero -> ascii
    MOV AH , 02h  ;imprime caracter
    INT 21h
    ;
    
    MOV DL , 13; char de fin de linea
    MOV AH, 02h  ;imprime caracter
    INT 21h
    
    MOV DL , 10; char de salto de linea
    MOV AH, 02h  ;imprime caracter
    INT 21h
    
    ;division
    XOR DX , DX; limpiar registro
    MOV DX , OFFSET tdiv
    MOV AH , 09h ;imprimir texto
    INT 21h
    
    XOR AX , AX; limpiar registro
    MOV AL , num1; AL = num1
    DIV num2; AL = AX / num2, AH = AX % num2    
    XOR CX , CX
    MOV CX , AX
    
    ;
    XOR AX , AX; limpiar registro
    MOV AL , CL; AL = div
    DIV diez; AL = AX / 10, AH = AX % 10
    XOR BX , BX
    MOV BX , AX; BX = AX
    
    MOV DL , BL
    ADD DL , 30h; numero -> ascii
    MOV AH , 02h  ;imprime caracter
    INT 21h
    
    MOV DL , BH
    ADD DL , 30h; numero -> ascii
    MOV AH , 02h  ;imprime caracter
    INT 21h
    ;
    
    MOV DL , 13; char de fin de linea
    MOV AH, 02h  ;imprime caracter
    INT 21h
    
    MOV DL , 10; char de salto de linea
    MOV AH, 02h  ;imprime caracter
    INT 21h
    
    ;residuo
    XOR DX , DX; limpiar registro
    MOV DX , OFFSET trec
    MOV AH , 09h ;imprimir texto
    INT 21h
    
    ;
    XOR AX , AX; limpiar registro
    MOV AL , CH; AL = div
    DIV diez; AL = AX / 10, AH = AX % 10
    XOR BX , BX
    MOV BX , AX; BX = AX
    
    MOV DL , BL
    ADD DL , 30h; numero -> ascii
    MOV AH , 02h  ;imprime caracter
    INT 21h
    
    MOV DL , BH
    ADD DL , 30h; numero -> ascii
    MOV AH , 02h  ;imprime caracter
    INT 21h
    ;
    
    ;fin de programa
    MOV AH, 4Ch
    INT 21h
END programa