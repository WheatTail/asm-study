use16
org 100h
    mov bx,145
    dec bx
    nop
    nop
    mov ax,bx
    mov ax,4C0h
    int 21h