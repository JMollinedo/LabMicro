.MODEL small

.DATA   ;segmento de datos (variables)
    num1 DB ? ;variable num1, valor sin asignar
    num2 DB ? ;variable num2, valor sin asignar
    aux1 DB ? ; variable aux1, valor sin asignar
    aux2 DB ? ; variable aux2, valor sin asignar
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
    JMP main
fin:
    MOV AH , 4Ch
    INT 21h
main:
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
    
    ;multiplicacion
    XOR DX , DX; limpiar registro
    MOV DX , OFFSET tmul
    MOV AH , 09h ; imprimir texto
    INT 21h
    
    XOR BX , BX ; limpiar registro
    MOV aux2 , 0 ;aux2 = 0
    MOV BL , num1 ; 
    MOV aux1 , BL ;aux1 = num1
    ADD aux1 , 0
multi:
    JZ rmulti ; si aux1 == 0 -> salto
    XOR BX , BX ;limpiar registro
    MOV BL , num2 ;
    ADD aux2 , BL ; aux2 += num2
    DEC aux1 ; aux1--
    JMP multi ; regresa a multi
rmulti:
    XOR BX , BX ;limpiar registro
    MOV BL , aux2 ; BL = aux2
    
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
    
    XOR BX , BX ; limpiar registro
    MOV aux2 , 0;
    MOV BL , num1 ;
    MOV aux1 , BL ; aux1 = num1
    CMP BL , num2
divis:
    JLE rdivis
    XOR BX , BX ; limpiar registro
    MOV BL , num2 ;
    SUB aux1 , BL ; aux1 -= num2
    INC aux2
    XOR BX , BX ; limpiar registro
    MOV BL , aux1 ;BL = aux1
    CMP BL , num2
    JMP divis
rdivis:    
    XOR AX , AX; limpiar registro
    MOV AL , aux2; AL = aux2
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
    MOV AL , aux1 ; AL = aux1
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
    JMP fin
        
END programa