; ADDITION OF FIVE INTEGERS 
; WORKING

ASSUME DS:DATA,CS:CODE

DATA SEGMENT
    INT1 DB 00H
    INT2 DB 00H
    INT3 DB 00H
    int4 db 00h
    int5 db 00h

    STR1 db 0AH,0DH,"First number:", '$';
    STR2 db 0AH,0DH,"Second number:",'$';
    STR3 db 0AH,0DH,"Third number:",'$';
    STR4 db 0AH,0DH,"Fourth number:",'$';
    STR5 db 0AH,0DH,"Fifth number:",'$';
    STRSUM db 0AH,0DH,"Sum is: ", '$';
DATA ENDS

CODE SEGMENT
    START:
        MOV AX,DATA
        MOV DS,AX

        mov dl, 10  ; DL = 10
        mov bl, 0  ; BL = 0

        ; print STR1
        LEA DX, STR1 ; Load address of str1 in dx
        MOV AH, 09H
        INT 21H
        
        scannum1: 
        ; To take a multiple digit number as input, we take 
        ; single digit input in a loop and add until user presses enter

        mov ah, 01h ; take one char as input (stored in AL)
        int 21h

        cmp al, 13   ; Check if user pressed ENTER KEY
        jz exit1

        mov ah, 0  
        sub al, 48   ; ASCII to DECIMAL

        mov cl, al   ; Move entered number to CL
        mov al, bl   ; Store the previous value in AL

        mul dl       ; multiply AL (previous value) with DL = 10
        ; product stored in AL

        add al, cl   ; Add new value to AL (which has previous value multiplied with 10 )
        mov bl, al   ; Move the result from AL to BL
        mov int1, bl ; Move from BL to INT1
        jmp scannum1

        exit1: 
        mov dl, 10  
        mov bl, 0 

        ; print STR2
        LEA DX, STR2
        MOV AH, 09H
        INT 21H   
        
        scannum2: mov ah, 01h
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
        mov int2,bl
        jmp scannum2

        exit2: mov dl, 10  
        mov bl, 0 

        ; print STR3
        LEA DX, STR3
        MOV AH, 09H
        INT 21H  
        
        scannum3: mov ah, 01h
        int 21h

        cmp al, 13   ; Check if user pressed ENTER KEY
        jz exit3

        mov ah, 0  
        sub al, 48   ; ASCII to DECIMAL

        mov cl, al
        mov al, bl   ; Store the previous value in AL

        mul dl       ; multiply the previous value with 10

        add al, cl   ; previous value + new value ( after previous value is multiplyed with 10 )
        mov bl, al
        mov int3,bl
        jmp scannum3

        exit3: mov dl, 10  
        mov bl, 0   

        ; print STR4
        LEA DX, STR4
        MOV AH, 09H
        INT 21H
        
        scannum4: mov ah, 01h
        int 21h

        cmp al, 13   ; Check if user pressed ENTER KEY
        jz exit4

        mov ah, 0  
        sub al, 48   ; ASCII to DECIMAL

        mov cl, al
        mov al, bl   ; Store the previous value in AL

        mul dl       ; multiply the previous value with 10

        add al, cl   ; previous value + new value ( after previous value is multiplyed with 10 )
        mov bl, al
        mov int4,bl
        jmp scannum4

        exit4: mov dl, 10  
        mov bl, 0  

        ; print STR5
        LEA DX, STR5
        MOV AH, 09H
        INT 21H 
        
        scannum5: mov ah, 01h
        int 21h

        cmp al, 13   ; Check if user pressed ENTER KEY
        jz exit5

        mov ah, 0  
        sub al, 48   ; ASCII to DECIMAL

        mov cl, al
        mov al, bl   ; Store the previous value in AL

        mul dl       ; multiply the previous value with 10

        add al, cl   ; previous value + new value ( after previous value is multiplyed with 10 )
        mov bl, al
        mov int5,bl
        jmp scannum5

        exit5: mov al,00H
        
        ; Adding the 5 numbers
        add al,int1
        add al,int2
        add al,int3
        add al,int4
        add al,int5


        ; print STRSUM
        LEA DX, STRSUM
        MOV AH, 09H
        INT 21H 

        mov ah, 00h
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