use16
org 100h
mov [a],3
mov ax,[a]
mov bx,[a]
mov cx,10
ml: mul bx
loop ml
mov ax,4C0h
int 21h
a dw ?