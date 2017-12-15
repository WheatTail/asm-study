use16
org 0x100
        mov ax,[x] ;ax = x
        mul ax ;ax = x*x
        mul ax ;ax =x*x*x
        mov [x],ax ; x=x*x*x
        mov ax,[b] ;ax = b
        mul ax ;ax = b*b
        mov [b],ax ;b = b*b
        mov ax,[x] ;ax = x*x*x
        mov bx,[b] ;bx = b*b
        add ax,bx ;ax = x*x*x + b*b
        mov bx,[c] ;bx = c
        sub ax,bx ;ax = x*x*x + b*b - c
        mul ax ;ax = (x*x*x + b*b - c) * (x*x*x + b*b - c)
        mov [z],ax ;z = (x*x*x + b*b - c) * (x*x*x + b*b - c)
mov ax,0x4C0 
int 0x21 

;===========
z dw ?
x dw 1 
b dw 2
c dw 3