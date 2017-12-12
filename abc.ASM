use16
org 0x100
    movsx ax,[a];a
    movsx bx,[a]
    imul ax,bx;a*a
    imul ax,bx;a*a*a
    cwd
    mov word[z],ax;z=a*a*a
    mov word[z+2],dx
    movsx ax,[a];a
    imul ax;a*a
    imul ax,3;a*a*3
    mov bx,[b]
    imul bx;a*a*3*b
    cwd
    sub word[z],ax;z=a*a*a-a*a*3*b
    sbb word[z],dx
    mov ax,word[c]
    mov bx,word[c+2]
    imul ax,ax
    imul bx,bx
    imul ax,3
    imul bx,3

mov ax,0x4C0
int 0x21
;========
a db 0x3
b dw 0xf
c dd 0xff
z dd ?
