.MODEL small
.STACK
.DATA
    num DB ? ;variable dig1, no asignada
    diez DB 10d
    dos DB 2d
    tins DB 'INGRESE DIGITO',13,10,'$'
    resv DB ?
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
    
    XOR AX , AX
    MOV AX , 03h ;limpia la pantalla
    INT 10h
    
    XOR AX , AX; limpiar registro
    MOV AL , num;AL = num
    MOV SI , 0
divir:
    DIV dos; AL = AX / 2, AH = AX % 2
    ADD AH , 30h
    
    MOV resv[SI] , AH
    ADD SI , 1
    
    MOV AH , 0
    CMP AL , 0
    JNZ divir
    MOV CX , SI
prin:
    SUB SI , 1
    MOV DL , resv[SI]; char de fin de linea
    MOV AH, 02h  ;imprime caracter
    INT 21h
    LOOP prin
    JMP fin
END programa