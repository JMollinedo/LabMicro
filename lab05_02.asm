.MODEL small
.STACK
.DATA
    diez DB 10d
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
    MOV DL , 88 ;char x
    MOV AH , 02h  ;imprime caracter
    INT 21h
    
    MOV AH , 07h;AL = teclado
    INT 21h
    CMP AL , 13
    JZ nocont
cont:
    MOV CX , 2
nocont:
    LOOP main
    JMP fin
END programa

delay proc 
    
    ;this procedure uses 1A interrupt, more info can be found on   
    ;http://www.computing.dcu.ie/~ray/teaching/CA296/notes/8086_bios_and_dos_interrupts.html
    mov ah, 00
    int 1Ah
    mov bx, dx
    
jmp_delay:
    int 1Ah
    sub dx, bx
    ;there are about 18 ticks in a second, 10 ticks are about enough
    cmp dl, delaytime                                                      
    jl jmp_delay    
    ret
    
delay endp