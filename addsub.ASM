use16
org 100h
    mov al,[k]
    sub al,al
    mov ah,[m]
    add ah,al
    inc ah
    mov bh,[n]
    mov bl,[r]
    dec bh
    sub bh,bl
    sub ah,bh
    mov [k],ah
    mov ax,4C0h
    int 21h
k db ?
m db 10
n db 15
r db 20