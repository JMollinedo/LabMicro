.MODEL small
.STACK
.DATA
    num DB ? ;variable dig1, no asignada
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
   
    XOR CX , CX;limpiar registro
    MOV CX , 2 ;CX = 2, cantidad de digitos
ingresar:    
    MOV AH , 01h;AL = teclado
    INT 21h
    SUB AL , 30h; ascii -> digito
    XOR BX , BX ;limpiar registro
    MOV BL , AL ; BL = AL
    MOV AL , num ; AL = num
    MUL diez; AL *= 10
    MOV num , AL; num = AL
    ADD num , BL; num += BL
    LOOP ingresar
    
    MOV DL , 13; char de fin de linea
    MOV AH, 02h  ;imprime caracter
    INT 21h
    
    MOV DL , 10; char de salto de linea
    MOV AH, 02h  ;imprime caracter
    INT 21h
    
    MOV DL , 13; char de fin de linea
    MOV AH, 02h  ;imprime caracter
    INT 21h
    
    MOV DL , 10; char de salto de linea
    MOV AH, 02h  ;imprime caracter
    INT 21h
    
    XOR CX , CX;limpiar registro
    MOV CL , num;CL = num
divir:
    XOR AX , AX; limpiar registro
    MOV AL , num;AL = null
    DIV CL
    CMP AH , 0
    JZ imprimir
contd:
    LOOP divir
    JMP fin
imprimir:
    XOR AX , AX; limpiar registro
    MOV AL , CL; AL = CL
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
    
    MOV DL , 13; char de fin de linea
    MOV AH, 02h  ;imprime caracter
    INT 21h
    
    MOV DL , 10; char de salto de linea
    MOV AH, 02h  ;imprime caracter
    INT 21h
    
    JMP contd;
END programa