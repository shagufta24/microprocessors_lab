; COUNT OF POSITIVE, NEGATIVE and ZERO
; WORKING

assume ds:data, cs:code

data segment
        num db -3,1,-5,6,-7,9,0, 0, 8, 2, -1, 0, -4, 16, 11, -78, 23, 4, -6, 0, '#'
        pos_count db 0h
        neg_count db 0h
        zero_count db 0h
        str1 db 0ah, 0dh, "Positive Count: ", '$'
        str2 db 0ah, 0dh, "Negative Count: ",'$'
        str3 db 0ah, 0dh, "Zero Count: ", '$'
data ends

code segment

start:
        mov ax,data
        mov ds,ax

        ; load address of array in SI
        lea si,num 
main:
        ; Comparing each number to zero
        cmp num[si], 0h
        jg positive
        jl negative

zero:
        add zero_count, 01h
        inc si
        cmp num[si], '#'
        je exit
        jmp main

negative:   
        add neg_count, 01h
        inc si
        cmp num[si],'#'
        je exit
        jmp main

positive:
        add pos_count, 01h
        inc si
        cmp num[si],'#'
        je exit
        jmp main

exit:

        lea dx, str1
        mov ah, 09h
        int 21h

        mov dl, pos_count
        add dl, '0'
        mov ah, 02h
        int 21h

        lea dx, str2
        mov ah, 09h
        int 21h

        mov dl, neg_count
        add dl, '0'
        mov ah, 02h
        int 21h

        lea dx, str3
        mov ah, 09h
        int 21h
        
        mov dl, zero_count
        add dl, '0'
        mov ah, 02h
        int 21h

        mov ah, 4ch
        int 21h

code ends
end start