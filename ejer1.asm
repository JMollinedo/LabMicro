.MODEL  small
.DATA
    num DB ?
    tins DB 'Numero: $'
    tpar DB 'EL numero es par$'
    timpar DB 'EL numero es impar$'
    res DB ?
.STACK
.CODE
programa:
    MOV AX , @DATA
    MOV DS , AX
    
    MOV DX , OFFSET tins
    MOV AH , 09h
    INT 21h
    
    XOR AX , AX
    MOV AH , 01h
    INT 21h
    SUB AL , 30;
    MOV num , AL
    
    XOR AX , AX
    MOV AL , num
    MOV BL , 2
    DIV BL
    MOV res , AH
    
    CMP res , 0
    JZ par
    
    MOV DL , 10
    MOV AH , 02h
    INT 21h
    MOV DX , OFFSET timpar
    MOV AH , 09h
    INT 21h
    JMP fin
par:
    MOV DL , 10
    MOV AH , 02h
    INT 21h
    MOV DX , OFFSET tpar
    MOV AH , 09h
    INT 21h
fin:
    MOV AH , 4Ch
    INT 21h
END programa