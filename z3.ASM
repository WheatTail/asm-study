use16
org 0x100
    mov cx,8 ;��� �����
    mov bx,2
    mov [a],array ;� ���������� -��������� �� ������
    mov [a1],array1
    mov [a2],array2
    mov [a3],array3
    mov [a4],array4
    mov si,array1 ;� ������� - �������
    cycle:
    mov si,[a1]
    mov ax,[si] ;� ������� - ������� �� ���������
    inc si ;����������� ��������� �� 2 (word)
    inc si
    mov [a1],si ;��������� ����� ���� � ����������
    jmp odd ;��� � ���������� �������� ���������
    exitodd:
    loop cycle ;��� ������������
    mov cx,8
    mov si,array2
    cycle2:
    mov si,[a2]
    mov ax,[si] ;� ������� - ������� �� ���������
    inc si ;����������� ��������� �� 2 (word)
    inc si
    mov [a2],si ;��������� ����� ���� � ����������
    jmp odd2 ;��� � ���������� �������� ���������
    exitodd2:
    loop cycle2 ;��� ������������
    mov cx,6
    mov [a],array
    mov [a3],array3
    mov [a4],array4
    cycle3:
    mov si,[a3]
    mov ax,[si] ;ax=array3[0]
    inc si
    inc si
    mov [a3],si
    mov si,[a4]
    mov bx,[si]
    inc si
    inc si
    mov [a4],si
    mov si,[a]
    mov [si],ax
    inc si
    inc si
    mov [si],bx
    inc si
    inc si
    mov [a],si
    loop cycle3
    mov cx,4
    mov bx,array
    add bx,12
    mov si,array4
    add si,24
    cycle4:
    mov ax,[si]
    inc si
    inc si
    mov [a4],si
    mov si,bx
    mov [si],ax
    inc si
    inc si
    mov bx,si
    loop cycle4
mov ax,0x4C0 ;�������-�� � �������� ������
int 0x21 ;� ����� ������ ��� ����������
;===========
array dw ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?
array1 dw 3,5,6,4,7,8,9,1
array2 dw 6,5,3,8,7,4,1,9
array3 dw ?,?,?,?,?,?
array4 dw ?,?,?,?,?,?,?,?,?,?
a dw ?
a1 dw ?
a2 dw ?
a3 dw ?
a4 dw ?

odd: ;��� �������. �����. ����� �� ���, ���� ������� 0 - �� ��� ������ ����� ���.
mov dx,ax ;��������� �������� ������� � dx, xnj,s gjnjv pfgb[yenm tuj d vfccbd
idiv bl
cmp ah,0
je ev
jmp od

ev:
mov si,[a3] ;� si ��������� �� ������ ������, ����� ���� ��������, ����� ���������, �������� ���
mov [si],dx
inc si
inc si
mov [a3],si
jmp exitodd

od:
mov si,[a4]  ;���� ����� �������
mov [si],dx
inc si
inc si
mov [a4],si
jmp exitodd

odd2: ;��� �������. �����. ����� �� ���, ���� ������� 0 - �� ��� ������ ����� ���.
mov dx,ax ;��������� �������� ������� � dx, xnj,s gjnjv pfgb[yenm tuj d vfccbd
idiv bl
cmp ah,0
je ev2
jmp od2

ev2:
mov si,[a3] ;� si ��������� �� ������ ������, ����� ���� ��������, ����� ���������, �������� ���
mov [si],dx
inc si
inc si
mov [a3],si
jmp exitodd2

od2:
mov si,[a4]  ;���� ����� �������
mov [si],dx
inc si
inc si
mov [a4],si
jmp exitodd2