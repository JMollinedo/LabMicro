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
	itr DB "Ingrese numero",10,13,0
	udm DB "Primero mayor que el segundo",10,13,0
	dum DB "Segundo mayor que el primero",10,13,0
	eqm DB "Numeros Iguales",10,13,0
	sig DB "-",0
.DATA?
	n1 DW  ?
	n2 DW  ?
	res DW ?
.CODE
program:
main PROC
	INVOKE StdOut, ADDR itr ;print instrucciones
	INVOKE StdIn, ADDR n1, 10 ;leer n1
	SUB n1 , 30h ;str -> num

	INVOKE StdOut, ADDR itr ;print instrucciones
	INVOKE StdIn, ADDR n2, 10 ;leer n2
	SUB n2 , 30h ;str -> num
	
	;suma
	MOV AX , n1
	ADD AX , n2
	print str$(AX),13,10
	;resta
	MOV AX , n1
	SUB AX , n2

	JS sec
	JZ igu
	print str$(AX),13,10
	INVOKE StdOut, ADDR udm ;print mensaje
	JMP fin
sec:
	MOV AX , n2
	SUB AX , n1
	INVOKE StdOut, ADDR sig ;print signo menos
	print str$(AX),13,10
	INVOKE StdOut, ADDR dum ;print mensaje
	JMP fin
igu:
	print str$(AX),13,10
	INVOKE StdOut, ADDR eqm ;print mensaje
fin:
	INVOKE ExitProcess,0
main ENDP
END program