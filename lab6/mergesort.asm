; MERGE SORT

data segment
    array db 9,4,5,3 ; Considering a 4-element array
    count dw 4
data ends

stack segment
    dw 128 dup(0)
stack ends

code segment
start:
     mov ax, data
     mov ds, ax

    split: ; To sort each adjacent pair of elements
        mov al, array[si] ; move number to AL
        mov dl, array[si+1] ; move next number to DL
        cmp al, dl
        jnc swap ; If DL is smaller, jump to swap
        jmp noswap
        swap: ; swapping AL and DL contents
            mov array[si+1],al
            mov array[si],dl
        noswap:
        add si, 2 ; incrementing SI by 2
        cmp si, count ; If SI reached end of array, jump to merge
        jz merge
        jmp split ; Repeat 

    merge:
        mov si, 0
        mov bl, 0
        mov ah, 0
        mov bh, 0
        mov ch, 0
        mov cl, 2
        iteration:
        ; Taking the pair of sorted 2-element arrays 
        ; and merging them to create a sorted 4 element array

            add si, bx ; bx is pointer for 1st array
            mov al, array[si] 
            sub si, bx
            add si, cx ; cx is pointer for 2nd array
            mov dl, array[si]
            sub si, cx
            cmp al, dl ; comparing first element of both arrays
            jnc o1 ; if dl is smaller, jump to o1
            ; push the smaller element to stack
                push ax
                inc bl
                jmp continue
            o1: push dx 
                inc cl
            continue:
                cmp bl, 2 ; if we reach end of 1st array, move contents of 2nd array to stack
                jz emptysecond
                cmp cl, 4 ; if we reach end of 2nd array, move contents of 1st array to stack
                jz emptyfirst
                jmp iteration ; Repeat
                emptysecond:
                    mov si, cx ; move cx (position in 2nd array) to si
                    l1: mov dl, array[si]
                        push dx ; push elements to stack
                        inc si
                        cmp si, 4
                        jnz l1
                        jmp fin
                emptyfirst:
                    mov si, bx ; move bx (position in 1st array) to si
                    l2: mov al, array[si]
                        push ax ; push elements to stack
                        inc si
                        cmp si, 2
                        jnz l2
                        jmp fin
        fin: mov si, 4 
        ; popping all elements from stack (will be in reverse order)
            repopulate:
                pop ax
                ; mov dx, ax
                ; add dl, '0'
                ; mov ah, 02h
                ; int 21h
                mov array[si-1], al ; storing them back in array in the correct order
                dec si
                cmp si, 0
                jnz repopulate

            ; Looping over the array and printing out sorted elements
            mov si, 0
            mov cx, count
            print: 
                mov dx, [si]
                add dx, '0'
                mov ah, 02h
                int 21h
                inc si
                dec cx
                cmp cx, 0000h
                jnz print

            mov ah, 4ch
            int 21h

code ends
end start