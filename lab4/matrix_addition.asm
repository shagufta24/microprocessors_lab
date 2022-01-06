; MATRIX ADDITION
; WORKING

ASSUME CS:CODE , DS:DATA

DATA SEGMENT
A DB 1, 0, 7, 6, 2, 1, 5, 2, 3 ;MATRIX 1
B DB 4, 8, 1, 3, 5, 7, 2, 4, 0 ;MATRIX2
RES DB 9 DUP(0) ;TO STORE SUM
NL DB 0ah, 0dh, " ", '$' ;New line
DATA ENDS

CODE SEGMENT
START:
MOV AX, DATA
MOV DS, AX

XOR AX, AX ;clear ax, bx and cl
MOV BX, AX
MOV CL, AL

LEA SI, A ;load address of a on si
LEA DI, B ;load address of b on di
LEA BX, RES ;load address of res array on bx
MOV CL, 9 ;set cl = 9 (counter)

L1:

MOV AL, [SI] ;mov matrix 1 number to ax
ADD AL, [DI] ;add matrix 2 number to it

MOV [BX], AL ;mov the sum to result
INC SI ;increment all 3 pointers
INC DI
INC BX
LOOP L1 ;loop until cl = 0 (9 times)

MOV CL, 9
LEA SI, RES

; Printing the result
RESULT:
MOV DL, [SI]
ADD DL, '0'
MOV AH, 02H
INT 21H

LEA DX, NL
mov ah, 09h
int 21h

INC SI
LOOP RESULT

MOV AH, 4CH
INT 21H

CODE ENDS 
END START