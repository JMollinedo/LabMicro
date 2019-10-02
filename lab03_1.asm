.MODEL small

.DATA   ;segmento de datos (variables)
    num1 DB 4 ;variable num1, valor asignado 3
    num2 DB 2 ;variable num2, valor asignado 2
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
    
    ;suma
    XOR DX , DX; limpiar registro
    MOV DX , OFFSET tsum
    MOV AH , 09h ;imprimir texto
    INT 21h
    
    XOR AL , AL; limpiar registro
    MOV AL , num1; AL = num1
    ADD AL , num2; AL += num2
    
    MOV DL , AL
    ADD DL , 30h; numero -> ascii
    MOV AH , 02h  ;imprime caracter
    INT 21h
    
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
    
    MOV DL , AL
    ADD DL , 30h; numero -> ascii
    MOV AH , 02h  ;imprime caracter
    INT 21h
    
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
    
    MOV DL , AL
    ADD DL , 30h; numero -> ascii
    MOV AH , 02h  ;imprime caracter
    INT 21h
    
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
    MOV AH , BL; BL = AH
    
    MOV DL , AL
    ADD DL , 30h; numero -> ascii
    MOV AH , 02h  ;imprime caracter
    INT 21h
    
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
    
    MOV DL , BL
    ADD DL , 30h; numero -> ascii
    MOV AH , 02h  ;imprime caracter
    INT 21h
    
    ;fin de programa
    MOV AH, 4Ch
    INT 21h
END programa