 
        org     100h

section .text

	call    config_inicial
	call 	texto	
	call 	cursor
	call 	texto1
	call 	texto2
	call 	texto3
	call	kbwait

	int 	20h

config_inicial:  mov     al, 8d
        mov     [202h], al

        mov     ax, 0000h
        mov     [200h], ax
        ret

texto:	mov 	ah, 00h
	mov	al, 03h
	int 	10h
	ret

cursor: mov	ah, 01h
	mov 	ch, 00000000b
	mov 	cl, 00001110b
	int 	10h
	ret

w_char:	mov 	ah, 09h
	mov 	al, cl
	mov 	bh, 0h
	mov 	bl, 00001111b
	mov 	cx, 1h
	int 	10h
	ret

kbwait: mov 	ax, 0000h
	int 	16h
	ret

m_cursr:mov 	ah, 02h
	mov 	dx, di  ; columna
	mov 	dh, [202h] ; fila
	mov 	bh, 0h
	int 	10h
	ret

fila1:mov     [200h], ax
        mov     ax, 4h
        add     [202h], ax
        mov     ax, [200h]
        ret
fila2:mov     [200h], ax
        mov     ax, 8h
        add     [202h], ax
        mov     ax, [200h]
        ret
fila3:mov     [200h], ax
        mov     ax, 7h
        add     [202h], ax
        mov     ax, [200h]
        ret
texto1:	mov 	di, 20d
loop1:	mov 	cl, [msg1+di-20d]
	call    m_cursr
	call 	w_char
	inc		di
	cmp 	di, len1
	jb		loop1
        call    fila1
	ret

texto2:	mov 	di, 05d
loop2:	mov 	cl, [msg2+di-05d]
	call    m_cursr
	call 	w_char
	inc		di
	cmp 	di, len2
	jb		loop2
        call    fila2
	ret

texto3:	mov 	di, 30d
loop3:	mov 	cl, [msg3+di-30d]
	call    m_cursr
	call 	w_char
	inc		di
	cmp 	di, len3
	jb		loop3
        call    fila3
	ret


section .data
msg1	db 	"que hace una abeja en un gimnasio?"
len1 	equ	$-msg1+20d
msg2	db 	"que?"
len2 	equ	$-msg2+05d
msg3	db 	"zumba"
len3 	equ	$-msg3+30d