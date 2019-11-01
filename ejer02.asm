.MODEL SMALL
.STACK
.DATA
    msj1 DB 'primera palabra: ',10,13,24h;
    msj2 DB 'segunda palabra: ',10,13,24h;
    
    msji DB 'cadenas iguales',10,13,24h;
    msjd DB 'cadenas distintas',10,13,24h;
    
    l1 DB 0
    l2 DB 0
    
    cadena1 DB 100 DUP (0)
    cadena2 DB 100 DUP (0)
.CODE
programa:
    MOV AX, @DATA
    MOV DS, AX ; Coloca el la direccion del segmento data en el apuntador correpondiente
    JMP main
fin:
    MOV AH , 4Ch
    INT 21h ; fin de programa
main:
    XOR DX , DX            
    MOV DX , OFFSET msj1
    MOV AH , 09h             
    INT 21h 
    
    XOR BX , BX
    XOR SI , SI ;Se limpia el registro
    LEA SI , cadena1 ;se guarda la direccion la cadena
    CALL leercad
    MOV l1 , BL
    
    XOR DX , DX            
    MOV DX , OFFSET msj2
    MOV AH , 09h             
    INT 21h 
    
    XOR BX , BX
    XOR SI , SI ;Se limpia el registro
    LEA SI , cadena2 ;se guarda la direccion la cadena
    CALL leercad
    MOV l2 , BL
    
    XOR AX , AX
    MOV AL , l1
    CMP AL , l2
    JNE neq
    MOV l2 , 0
    LEA SI , cadena1
    LEA DI , cadena2
cbc:
    XOR DX , DX
    MOV DL , [SI]
    CMP DL , [DI]
    JNE neq
    INC DI
    INC SI
    INC l2
    XOR AX , AX
    MOV AL , l1
    CMP l2 , AL
    JNE cbc

    XOR DX , DX            
    MOV DX , OFFSET msji
    MOV AH , 09h             
    INT 21h
    JMP fin
neq:
    XOR DX , DX            
    MOV DX , OFFSET msjd
    MOV AH , 09h             
    INT 21h 
    JMP fin
leercad PROC NEAR
    ingreso:        
        CALL leerchar
        CMP AL, 13
        JE fincad;si es salto de linea
        MOV [SI] , AL;mueve el valor a la posicion del apuntador
        INC SI;incrementa en 1 la posicion de memoria
        INC BX
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