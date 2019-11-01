.MODEL SMALL
.STACK
.DATA
    cadena DB ?
.CODE
programa:
    MOV AX , @DATA
    MOV DS , AX ; Coloca el la direccion del segmento data en el apuntador correpondiente
    JMP main
fin:
    MOV AH , 4Ch
    INT 21h ; fin de programa
main:
    XOR SI , SI ;Se limpia el registro
    LEA SI , cadena ;se guarda la direccion la cadena
    
    CALL leercad
    
    XOR DX , DX            
    MOV DX , OFFSET cadena  
    MOV AH , 09h             
    INT 21h 
    
    JMP fin
leercad PROC NEAR
    ingreso:        
        CALL leerchar
        CMP AL , 13
        JE fincad;si es salto de linea
        SUB AL , 20h;convierte en mayusculas
        MOV [SI] , AL;mueve el valor a la posicion del apuntador
        INC SI;incrementa en 1 la posicion de memoria
        JMP ingreso   
    fincad:
        MOV [SI] , 24h;caracter $
        XOR AX , AX
        MOV DL ,10;fin de linea 
        MOV AH ,02
        INT 21h
        XOR AX , AX
        MOV DL ,13;salto de linea
        MOV AH ,02
        INT 21h
        RET
leercad ENDP
leerchar PROC NEAR
    XOR AX , AX
    MOV AH , 01h
    INT 21h
    RET
leerchar ENDP
END programa