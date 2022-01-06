; MULTIPLIATION OF 3 NUMBERS
; WORKING

ASSUME DS:DATA,CS:CODE

DATA SEGMENT
    INT1 db 00H
    INT2 db 00H
    INT3 db 00H
    
    STR1 db 0AH,0DH,"First number:", '$';
    STR2 db 0AH,0DH,"Second number:",'$';
    STR3 db 0AH,0DH,"Third number:",'$';
    STRPROD db 0AH,0DH,"Product is: ", '$';

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
        
        scannum1: mov ah, 01h
        int 21h

        cmp al, 13   ; Check if user pressed ENTER KEY
        jz exit1

        mov ah, 0  
        sub al, 48   ; ASCII to DECIMAL

        mov cl, al
        mov al, bl   ; Store the previous value in AL

        mul dl       ; multiply the previous value with 10

        add al, cl   ; previous value + new value ( after previous value is multiplyed with 10 )
        mov bl, al
        mov int1,bl
        jmp scannum1

        exit1: mov dl, 10  
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

        exit3: 
        mov bh,00h
        MOV cl, INT2 ; Cl = INT2
        mov ch,bh
        MOV al,INT1 ; AL = INT1
        mov ah,bh
        MOV BX,0000H

        ; multiplication by repeated addition
        LOOP1: ADD BX,AX ; Add AX = INT1 to itself CX = INT2 number of times
               DEC CX
               JNZ LOOP1
               ; AX now has INT1*INT2
        MOV cl,INT3
        mov ch,bh
        MOV AX,BX
        MOV BX,0000H
        LOOP2: ADD BX,AX ; Add AX = INT1*INT2 to itself CX = INT3 number of times
               DEC CX
               JNZ LOOP2
               ; AX now has INT1*INT2*INT3

        ; print STRPROD
        LEA DX, STRPROD
        MOV AH, 09H
        INT 21H 
        
        mov ax,bx
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