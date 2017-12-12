use16
org 100h
    mov dx,string
        mov ah,9
        int 21h
        int 21h
        int 21h
        mov ax,4C0h
        int 21h
string db 'Asm best', 0dh, 0ah, '$'