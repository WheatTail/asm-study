use16
org 0x100
    movsx ax,[b]
    imul ax
    mov word[d],ax;d=b*b
    mov ax,[a]
    mov bx,[c]
    imul bx
    mov bx,0x4
    imul bx;4*a*c
    sub word[d],ax;d=b*b-4*a*c
    mov ax,word[d];display d
    mov ax,1;prepare values for compare
    mov bx,1
    mov cx,1
    compare:
    mov ax,cx;search by mul compare
    imul bx
    cmp ax,[d]
    jne extinc;if no compared
    je exitcomp;if compared
    exitcomp:
    mov cx,bx;cx=root(d)
    movsx ax,[b]
    mov bx,2
    imul bx
    sub ax,bx;-b
    add ax,cx;;-b+root(d)
    mov bx,[a]
    imul bx,[jsttw]
    idiv bx;x1
    cwd
    mov word[x1],ax
    mov word[x1+2],dx
    movsx ax,[b]
    mov bx,2
    imul bx
    sub ax,bx;-b
    sub ax,cx;-b-root(d)
    mov bx,[a]
    imul bx,[jsttw]
    idiv bx;x2
    cwd
    mov word[x2],ax
    mov word[x2+2],dx
mov ax,0x4C0
int 0x21

extinc:;just external inc for values
inc bx
inc cx
jmp compare
;======
a dw 3
b db 13
c dw 12
jsttw dw 2
d dw ?
x1 dd ?
x2 dd ?