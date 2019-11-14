MulCad MACRO cad,res,tam,fac
	PUSHA

	;Limpiar Registros
	XOR EAX , EAX
	XOR EBX , EBX
	XOR ECX , ECX
	XOR EDX , EDX
	XOR SI , SI
	XOR DI , DI

	;limpiar destino
	MOV CL , tam
	cic:
	MOV SI , CX
	MOV res[SI] , 0
	LOOP cic

	;multiplicar
	MOV CL , tam
	MOV SI , 0
	recor:
	XOR AX , AX
	MOV AL , cad[SI]
	MUL fac
	ADD res[SI] , AL
	INC SI
	ADD res[SI] , AH
	LOOP recor

	POPA
ENDM

.386
;model
.MODEL FLAT, STDCALL ;flat = small
OPTION CASEMAP:NONE
;includes
INCLUDE \masm32\include\windows.inc ; incluye formularios
INCLUDE \masm32\include\kernel32.inc
INCLUDE \masm32\include\masm32.inc
INCLUDE \masm32\include\masm32rt.inc ;llamadas a caracteristicas del sistema
;librerias
INCLUDELIB \masm32\lib\kernel32.lib
INCLUDELIB \masm32\lib\masm32.lib

.DATA
	itr DB "Ingrese numero de tres cifras",10,13,0
	mer DB "FACTORAL DE ",0
	diez DB 10
.DATA?
	dir DB ?,0
	cad DB 3 dup(?)
	n1 DB ?
	res DB 100 dup(0)
.CODE
program:
main PROC
	INVOKE StdOut, ADDR itr ;print instrucciones
	INVOKE StdIn, ADDR cad, 10 ;leer n1

	MOV n1 , 0

	MOV AL , cad[2]
	SUB AL , 30h
	ADD n1 , AL

	MOV AL , cad[1]
	SUB AL , 30h
	MUL diez
	ADD n1 , AL

	MOV AL , cad[0]
	SUB AL , 30h
	MUL diez
	MUL diez
	ADD n1 , AL

	INVOKE StdOut, ADDR mer
	print str$(n1),10,13

	XOR EAX , EAX
	XOR EDX , EDX
	XOR ECX , ECX
	MOV EAX , 1
	MOV CL , n1
multip:	
		MUL ECX
	LOOP multip
	print str$(EAX),10,13
fin:
	INVOKE ExitProcess,0
main ENDP
END program