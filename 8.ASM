use16
org 100h
    movsx ax,[x]
    imul [y]
    cwd
    movsx bx,[x]
    add bx,[y]
    idiv bx
    cwd
    mov word[z],ax
    mov word[z+2],dx
mov ax,4C0h
int 21h

;------------------------------------
x db -5
y dw -10
z dd ?