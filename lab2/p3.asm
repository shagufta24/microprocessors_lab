; Series: 1 + x + x^2 + x^3 + ... + x^n
; The sum is given by the formula (1-x^n)/(1-x)

;WORKING

ASSUME DS:DATA,CS:CODE

DATA SEGMENT
    NUM DB 00H
    X db 00H

    STR1 db 0AH,0DH,"Enter n:", '$';
    STR2 db 0AH,0DH,"Enter x:",'$';

DATA ENDS

CODE SEGMENT
    START:
        MOV AX,DATA
        MOV DS,AX
        mov dl, 10  
        mov bl, 0   

        ; print STR1
        LEA DX, STR1
        MOV AH, 09H
        INT 21H 
        
        scannum: mov ah, 01h
        int 21h

        cmp al, 13   ; Check if user pressed ENTER KEY
        jz exit

        mov ah, 0  
        sub al, 48   ; ASCII to DECIMAL

        mov cl, al
        mov al, bl   ; Store the previous value in AL

        mul dl       ; multiply the previous value with 10

        add al, cl   ; previous value + new value ( after previous value is multiplyed with 10 )
        mov bl, al
        mov num,bl
        jmp scannum

        exit: mov dl, 10  
        mov bl, 0   

        ; print STR2
        LEA DX, STR2
        MOV AH, 09H
        INT 21H 
        
        scannum2: 
        mov ah, 01h
        int 21h

        cmp al, 13   ; Check if user pressed ENTER KEY
        jz exit2

        mov ah, 0  
        sub al, 48   ; ASCII to DECIMAL

        mov cl, al
        mov al, bl   ; Store the previous value in AL

        mul dl       ; multiply the previous value with 10

        add al, cl   ; previous value + new value ( after previous value is multiplyed with 10 )
        mov bl, al
        mov x,bl
        jmp scannum2
        
        ; POPULATE A SERIES OF N CONSECUTIVE NUMBERS
        exit2: 
        MOV CL, NUM
        MOV SI, 6000H
        MOV AL, 01H
        LOOP1: 
        MOV [SI], AL
            ADD SI,01H
            ADD AL,01H
            DEC CL
            JNZ LOOP1
        
        ; Finding X^N
        MOV CL,NUM
        MOV AX,0000H
        MOV AL,X
        cmp al, 01h
        jz loopfor1
        MOV BX, AX
        LOOP2: 
        MUL BX
            DEC CL
            JNZ LOOP2
        
        ; Finding (X-1), put it in BX
        MOV BX, 0000H
        MOV BL, X
        SUB BL, 01H
        
        MOV CX, 0000H
        SUB AX, 01H ; We get (X^N - 1) in AX

        ; Division (AX/BX) by repeated subtraction
        LOOP3: SUB AX,BX
            ADD CX,01H
            CMP AX,0000H
            JNZ LOOP3
        
        mov ax,cx
        jmp print

        loopfor1:
        mov al,num
        add al,01h
        mov ah,00h
        
        print: 
        mov cx,0
        mov dx,0
        label1:
        ; if ax is zero
        cmp ax,0
        je print1     
            
        ;initialize bx to 10
        mov bx,10       
            
        ; extract the last digit
        div bx                 
            
        ;push it in the stack
        push dx             
            
        ;increment the count
        inc cx             
            
        ;set dx to 0
        xor dx,dx
        jmp label1
        print1:
        ;check if count
        ;is greater than zero
        cmp cx,0
        je exitf
            
        ;pop the top of stack
        pop dx
            
        ;add 48 so that it
        ;represents the ASCII
        ;value of digits
        add dx,48
            
        ;interrupt to print a
        ;character
        mov ah,02h
        int 21h
            
        ;decrease the count
        dec cx
        jmp print1

        

        exitf:
        MOV AH,4CH
        INT 21H
        

CODE ENDS
END START