use16
org 100h
    mov ax,[x]
    imul ax,[y]
    mov bx,ax
    mov ax,[x]
    add ax,[y]
    idiv bx
;    mov dx, bx
;    mov ax,9
;    int 21h
    mov ax,[x]
    mov bx,[y]
    mov ax,4C0h
    int 21h
z dw ?
x dw 50
y dw 100