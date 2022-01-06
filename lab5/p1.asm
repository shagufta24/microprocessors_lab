; WORKING

DATA SEGMENT
N1 DB 1, 3, 5, 2, 6, 9, 2, 7, 5, 4 ; Store the n-byte number as an array of digits
N2 DB 7, 6, 2, 1, 3, 0, 4, 2, 4, 5
N  DB 10
RESULT DB 6 DUP (00)
DATA ENDS

CODE SEGMENT
ASSUME CS: CODE, DS: DATA
START: 
MOV AX, DATA
MOV DS, AX
MOV CL, N
LEA SI, N1
LEA DI, N2
LEA BX, RESULT
CLC
L1:  MOV AL, [SI] ; SI points to num1
     MOV DL, [DI] ; DI points to num2
     ADC AL, DL ; Add the numbers with carry
     MOV [BX], AL ; Move the sum to result
     INC SI
     INC DI
     INC BX
     DEC CL
     JNZ L1
     JNC NEXT

     MOV BYTE PTR[BX],01H ; store carry resulted after N byte addition.

NEXT:
LEA SI, RESULT
MOV CL, N

PRINT:
MOV DL, [SI]
ADD DL, '0'
MOV AH, 02H
INT 21H
INC SI
DEC CL
CMP CL, 00H
JNE PRINT

MOV AH, 4CH
INT 21H
     
CODE ENDS
END START
