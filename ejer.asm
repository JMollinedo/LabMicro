.MODEL SMALL
.STACK
.DATA
    msj1 DB 'primera palabra: ',10,13,24h;
    
    msji DB 'palindromo',10,13,24h;
    msjd DB 'no palindromo',10,13,24h;
    
    l1 DB 0
    
    cadena1 DB 100 DUP (0)
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
    MOV DI , SI
    LEA SI , cadena1
cbc:
    
    XOR DX , DX
    MOV DL , [SI]
    CMP DL , [DI]
    JNE neq
    MOV DX , DI
    SUB DX , SI
    CMP DX , 1
    JZ palin
    DEC DI
    INC SI
    CMP SI , DI
    JNE cbc
palin:
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
        DEC SI
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