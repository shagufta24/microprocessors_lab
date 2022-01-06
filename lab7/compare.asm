ASSUME CS:CODE , DS:DATA   

DATA SEGMENT 
STR1 DB "AELL0", '$'    
STR2 DB "HELL0", '$' 
ANS DB 1 DUP(0)
DATA ENDS 

CODE SEGMENT
START: 
MOV AX, DATA   
MOV DS, AX  

LEA SI, STR1
LEA DI, STR2
MOV CL, 05H

COMPARE:
MOV BL, [SI]
CMP BL, [DI]
JG GT
JL LT
INC SI
INC DI
LOOP COMPARE

MOV DL, 00H
ADD DL, '0'
MOV AH, 02H
INT 21H
JMP EXIT

GT:
MOV DL, 01H
ADD DL, '0'
MOV AH, 02H
INT 21H
JMP EXIT

LT: 
MOV DL, 2DH
MOV AH, 02H
INT 21H
MOV DL, 01H
ADD DL, '0'
MOV AH, 02H
INT 21H

EXIT:
MOV AH, 4CH    
INT  21H
CODE ENDS
END START