use16
org 100h
    mov ax,255
    inc ax
    nop
    mov bx,ax
    mov ax,4C0h
int 21h