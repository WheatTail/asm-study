use16
org 0x100
    movsx ax,[a]
    movsx bx,[a]
    imul bx
    imul bx;a^3
    cwd
    mov word[r],ax
    mov word[r+2],dx;=a^3
    movsx ax,[a]
    imul ax
    mov bx,[b]
    imul bx
    imul ax,3
    cwd
    mov cx, 0x0
    sub word[r],ax
    sbb word[r+2],dx;r=a^3-3a^2b
    movsx ax,[a]
    imul ax,3
    cwd
    imul ax,word[c]
    imul dx,word[c+2]
    imul ax,word[c]
    imul dx,word[c+2]
    add word[r],ax
    adc word[r+2],dx;r=a^3-3a^2b+3ac^2
    mov ax,[b]
    mov bx,[b]
    imul bx
    imul bx
    cwd
    sub word[r],ax
    sbb word[r+2],dx;r=a^3-3a^2b+3ac^2-b^3
    mov ax,word[r]
    mov dx,word[r+2]
    mov bx,0x2
    idiv bx
    mov word[r],ax
    mov ax,dx
    idiv bx
    mov word[r+2],ax;r=(a^3-3a^2b+3ac^2-b^3)/2
mov ax,0x4C0
int 0x21
;=======
a db 0x2
b dw 0x3
c dd 0x4
r dd 0x0