; COUNT OF EVEN NUMBERS
; WORKING

; DIV BX means AX/BX. Quotient in AX, remainder in DX
; DIV BL means AX/BL. Quotient in AL, remainder in AH

data segment
NUM DW 1,2,9,10,3,15,11,12,5,6 ; 4 even numbers
data ends

CODE SEGMENT

assume ds:data,  cs:code

start:  mov ax,data
        mov ds,ax
        MOV BX,0000H
        MOV DX,0000H

        lea SI,NUM ; Load address of array NUM in SI

        MOV BL,02 ; To divide each number by 2
        MOV CL,10 ; Count of array elements

    L1: MOV AX, [SI]
        DIV BL ; Dividing number by 2
        CMP AH,00 ; Remainder == 0?
        JNZ L2 ; If odd, jump to L2
        INC DL ; If even, increment DL
        JMP L3

    L2: MOV DH,00

    L3: ADD SI,2 ; Next number
        DEC CL
        CMP CL,00
        JNZ L1

        ; Printing output
        add dx, 48
        mov ah, 02h
        int 21H

        MOV AH,4CH
        INT 21H
CODE ENDS
END START
