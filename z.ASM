use16
org 0x100
    mov cx,16 ;��� �����
    mov bx,2
    mov [a],array ;� ���������� -��������� �� ������
    mov [o],arrayo
    mov [e],arraye
    mov [t],arrayt
    mov si,array ;� ������� - �������
    cycle:
    mov si,[a]
    mov ax,[si] ;� ������� - ������� �� ���������
    inc si ;����������� ��������� �� 2 (word)
    inc si
    mov [a],si ;��������� ����� ���� � ����������
    jmp odd ;��� � ���������� �������� ���������
    exitodd:
    loop cycle ;��� ������������
    mov [o],arrayo ;��������� �� ������ ����� ����
    mov [e],arraye
    mov cx,8 ;��� �����
    cycle2: ;� �� ����� ������� ��� ���������
    mov si,[o] ;� ������ ������� ��������� �� ������ �������
    mov ax,[si] ;� ������ �������� �� ��������
    inc si ;�� �� ������
    inc si
    mov [o],si ;���������� �������� �������� ���-���-���
    mov si,[e] ;�������� �� �� ����� � ��������� (��� ��������, � ��������� ���)
    mov bx,[si]
    inc si
    inc si
    mov [e],si
    add ax,bx ;����������
    mov si,[t] ;� ������ � �������� ������
    mov [si],ax
    inc si
    inc si
    mov [t],si
    loop cycle2
mov ax,0x4C0 ;�������-�� � �������� ������
int 0x21 ;� ����� ������ ��� ����������
;===========
array dw 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16
arrayo db ?,?,?,?,?,?,?,?
arraye dw ?,?,?,?,?,?,?,?
arrayt dw ?,?,?,?,?,?,?,?
a dw ?
o dw ?
e dw ?
t dw ?


odd: ;��� �������. �����. ����� �� ���, ���� ������� 0 - �� ��� ������ ����� ���.
mov dx,ax ;��������� �������� ������� � dx, xnj,s gjnjv pfgb[yenm tuj d vfccbd
idiv bl
cmp ah,0
je ev
jmp od

ev:
mov si,[e] ;� si ��������� �� ������ ������, ����� ���� ��������, ����� ���������, �������� ���
mov [si],dx
inc si
inc si
mov [e],si
jmp exitodd

od:
mov si,[o]  ;���� ����� �������
mov [si],dx
inc si
inc si
mov [o],si
jmp exitodd
