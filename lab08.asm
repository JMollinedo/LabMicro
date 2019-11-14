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
	itr DB "Ingrese numero de tres cifras. ej: 003 , 012 , 101",10,13,0
	mer DB "FACTORAL DE ",0
	cien DB 100
	diez DB 10
	tmp DB 100 dup(0)
	res DB 100 dup(0)
.DATA?
	cad DB 3 dup(?)
	n1 DB ?
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
	MUL cien
	ADD n1 , AL

	INVOKE StdOut, ADDR mer
	print str$(n1),10,13

	XOR ECX , ECX

	MOV tmp , 1
	MOV CL , n1
	multip:
	XOR ESI , ESI
	XOR EDI , EDI
		next:
		XOR EAX , EAX
		MOV AL , tmp[ESI]
		MUL CL
		ADD res[ESI] , AL
		ADD res[ESI+1] , AH

		INC SI
		CMP SI , 100
		JNZ next
		cut:
		XOR EAX , EAX
		MOV AL , res[EDI]
		MOV tmp[EDI] , AL
		MOV res[EDI] , 0
		INC DI
		CMP DI , 100
		JNZ cut
	LOOP multip
	XOR ECX , ECX
	XOR EBX , EBX
	MOV CL , 100
	MOV ESI , 99
	most:
		MOV AL , tmp[ESI]
		MOV n1 , AL
		DEC SI
		PUSHA
		print str$(n1)
		POPA

	LOOP most
fin:
	INVOKE ExitProcess,0
main ENDP
END program