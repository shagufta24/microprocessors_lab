; SELECTION SORT
; Works on EMU8086

assume ds:data, cs:code

data segment
    arr db 3,1,5,2,9,6,2,7,3,'#' 
    count db 0AH
data ends

code segment
start:
    mov ax, data
    mov ds, ax

    mov di, 2000h ; DI points to memory location 2000
    lea si,arr ; SI points to arr
    xor al,al ; clearing AL

    storeloop:
    ; storing the array at location 2000 in memory
        cmp [si],'#'
        je exit
        mov dl, [si] ; move each element to DL
        inc si
        mov [di], dl ; move element to memory location
        inc di
        mov al, [di]
        jmp storeloop
    exit:
        mov di, 2000h ; both DI and SI point to 2000h
        mov si, 2000h
        mov cl, 10h ; counter = 10
        xor ch, ch ; clear CH
        dec cx ; counter = 9
    loop1:
        mov bx, si
        mov ah, cl ; AH = count
        inc ah
        mov al, [si] 
        inc si
        dec ah

        ; AL stores the current minimum
        ; BX points to current minumim
        ; SI iterates over the remaining array to find the minimum
        ; AH counts how many elements left to iterate over
        ; DI stores the address of the unsorted (right) portion of array

    loop2: ; To compare each consequent number with the current number
        cmp al, [si] ; compare with AL
        jc continue ; If number is larger, jump to continue
        mov al, [si] ; If number is smaller, Move that number into AL
        mov bx, si

    continue:
        inc si ; SI points to next number
        dec ah
        jnz loop2

        mov dl, [bx] ; BX points to minimum num. Move it to DL
        xchg dl, [di] ; Swap minimum num with the number at its correct position
        xchg dl, [bx]
        inc di ; Shift DI to right
        mov si, di
        dec cl
        cmp cl, 0h
        jnz loop1
        
        mov si, 2007h
        mov cl, count
    print:
        mov dl, [si]
        add dl, '0'
        mov ah, 02h
        int 21H
        inc si 
        dec cl
        cmp cl, 01H
        jne print

        mov ah, 4ch
        int 21h
code ends
end start