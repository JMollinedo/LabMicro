Facto MACRO num,res
	PUSHA
	
	;Limpiar Registros
	XOR EAX , EAX
	XOR ECX , ECX

	MOV EAX , 1
	MOV CL , num
	multip:	
		MUL ECX
	LOOP multip
	MOV res , EAX
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
	cad DB 3 dup(?)
	n1 DB ?
	res DD ?
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
	Facto n1,res
	print str$(res),10,13
fin:
	INVOKE ExitProcess,0
main ENDP
END program