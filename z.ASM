use16
org 0x100
    mov cx,16 ;для цикла
    mov bx,2
    mov [a],array ;в переменные -указатели на массив
    mov [o],arrayo
    mov [e],arraye
    mov [t],arrayt
    mov si,array ;в регистр - указате
    cycle:
    mov si,[a]
    mov ax,[si] ;в регистр - знаение по указателю
    inc si ;увеличиваем указатель на 2 (word)
    inc si
    mov [a],si ;слхраняем указа тель в переменную
    jmp odd ;идём м впроцеружу проверки четнсости
    exitodd:
    loop cycle ;тут зщациклилось
    mov [o],arrayo ;указатели на массив снова сюда
    mov [e],arraye
    mov cx,8 ;для цикла
    cycle2: ;я не готов сейывас это обсуждать
    mov si,[o] ;а регист массива указатель на начало чётного
    mov ax,[si] ;в реистр значение из масстива
    inc si ;ну вы поняли
    inc si
    mov [o],si ;сохраняекм значение регистра бла-бла-бла
    mov si,[e] ;повторям ту же хрень с нечётными (или наоборот, я азпутался уже)
    mov bx,[si]
    inc si
    inc si
    mov [e],si
    add ax,bx ;складываем
    mov si,[t] ;и пихаем в четвёртый массив
    mov [si],ax
    inc si
    inc si
    mov [t],si
    loop cycle2
mov ax,0x4C0 ;наконец-то я выберусь отсюда
int 0x21 ;я прямо ощущаю это прерывание
;===========
array dw 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16
arrayo db ?,?,?,?,?,?,?,?
arraye dw ?,?,?,?,?,?,?,?
arrayt dw ?,?,?,?,?,?,?,?
a dw ?
o dw ?
e dw ?
t dw ?


odd: ;это тогоэто. забыл. Делим на два, если остаток 0 - то оно чётное иначе нет.
mov dx,ax ;сохраняем значение еткущее в dx, xnj,s gjnjv pfgb[yenm tuj d vfccbd
idiv bl
cmp ah,0
je ev
jmp od

ev:
mov si,[e] ;в si указатель на массив чётных, потом туда значение, апаем указатель, сохрняем его
mov [si],dx
inc si
inc si
mov [e],si
jmp exitodd

od:
mov si,[o]  ;тоже самое еророче
mov [si],dx
inc si
inc si
mov [o],si
jmp exitodd
