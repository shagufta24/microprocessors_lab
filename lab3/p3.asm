; FINDING PARITY
;In conditional jumps, parity flag is used, where e.g. the JP instruction jumps to the given target
;when the parity flag is set and the JNP instruction jumps if it is not set. 
;The flag may be also read directly with instructions such as PUSHF, which pushes the flags register on the stack.
; WORKING

assume ds:data, cs:code

data segment
        num db 3, 1, 5, 7, 4, 1, 2, 4, 9, 6, 0, 8, 3, 5, 6, 4, '#'
        str1 db "  00", 0ah, 0dh, '$'
        str2 db "  01", 0ah, 0dh, '$'
    
data ends

code segment

start:
        mov ax, data
        mov ds, ax

        lea si,num ;load base address of array into si
main:
        mov bl, num[si] ;load number to bl, add zero (no change to it) and check parity flag
        add bl, 0h
        jp even_parity ; PF has 1 if even parity

        ; ODD PARITY
        mov dl, num[si] ; move number to dl for printing
        add dl, '0'
        mov ah, 02h
        int 21h

        lea dx, str2
        mov ah, 09h
        int 21h

        inc si ; next number

        cmp num[si], '#' ; if end of string, exit, else repeat.
        je exit
        jmp main

even_parity:
        ; EVEN PARITY
        mov dl, num[si] ; mov number to dl for printing
        add dl, '0'
        mov ah, 02h
        int 21h

        lea dx, str1
        mov ah, 09h
        int 21h

        inc si ; next number

        cmp num[si], '#' ; if end of string, exit. else jump to main
        je exit
        jmp main

exit:
        mov ah, 4ch
        int 21h

code ends
end start