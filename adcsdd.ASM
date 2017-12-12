use16
org 100h

    mov ax,word[b]
    add ax,word[a]
    mov word[d],ax

    mov ah,byte[b+2]
    adc ah,byte[a+2]
    mov byte[d+2],ah

    mov ax,4C0h
    int 21h

a rw 0xF
  rb 0x1
b rw 0x10
  rb 0x2
c rw 0xFF
  rb 0x5
d rb 0