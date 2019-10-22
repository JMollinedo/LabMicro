.MODEL small
.STACK
.DATA
    dig1 DB ? ;variable dig1, no asignada
    dig2 DB ? ;variable dig2, no asignada
    diez DB 10d
    tins DB 'INGRESE DIGITO$'
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
    MOV dig1 , AL
    
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
    MOV dig2, AL
    
    MOV DL , 13; char de fin de linea
    MOV AH, 02h  ;imprime caracter
    INT 21h
    
    MOV DL , 10; char de salto de linea
    MOV AH, 02h  ;imprime caracter
    INT 21h
    
    ;multiplicacion
    XOR CX , CX ;limpiar registro
    MOV CL , dig2 ;CL = dig2
    XOR BL , BL ;limpair registro
multiplicar:
    ADD BL , dig1 ; BL += BL
    LOOP multiplicar ; CX-- si CX != 0, salto
    
    mov ax, 0003h   ;limpia la pantalla
    int 10h
    
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
    
    
    JMP fin
END programa