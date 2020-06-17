org 100h
section .text

init:                   ;comenzamos con el mensaje inicial
    call texto 
    mov bl, 00001110b 
    mov dl, 3h 
    mov bp, msgDos 
    mov si, lenDos
    call w_strng


First:                      ;funcion donde pedimos primer dato
    xor si, si
    mov al, 0d
    call input 
    mov [400h], al
    sub     al, 30h
    mov [500h], al
    mov si, 05h
    mov bl, 00101110b ;atributos amarillo:1110 verde:0010
    mov dl, 30h ; columna inicial
    mov bp, 400h ; casilla inicial
    call w_strng    
Second:    
    mov al, 0d                 ;funcion donde pedimos el segundo dato
    call input              ;pedimos el dato
    mov [401h], al
    sub     al, 30h
    mov [501h], al
    mov si, 09h
    mov bl, 00101110b ;atributos amarillo:1110 verde:0010
    mov dl, 30h ; columna inicial
    mov bp, 400h ; casilla inicial            
    call w_strng     

 Third: 
    mov al, 0d                   
    call input              ;pedimos el dato
    mov [402h], al
    sub     al, 30h
    mov [502h], al
    mov si, 09h
    mov bl, 00101110b ;atributos amarillo:1110 verde:0010
    mov dl, 30h ; columna inicial
    mov bp, 400h ; casilla inicial           
    call w_strng   

Fourth:                    
    mov al, 0d
    call input              ;pedimos el dato
    mov [403h], al 
    sub     al, 30h
    mov [503h], al   
    mov si, 09h
    mov bl, 00101110b ;atributos amarillo:1110 verde:0010
    mov dl, 30h ; columna inicial
    mov bp, 400h ; casilla inicial             
    call w_strng   

fiveth:  
    mov al, 0d
    call input              ;pedimos el dato
    mov [404h], al
    sub     al, 30h
    mov [504h], al
    call clear
    mov si, 09h
    mov bl, 00101110b ;atributos amarillo:1110 verde:0010
    mov dl, 30h ; columna inicial
    mov bp, 400h ; casilla inicial            
    call w_strng   



calc:                      
    call validateS  
    call avgprev
    call avg
    call mostrar
avgprev:mov     bx, 0000h
        mov     ax, 0000h

avg:    add     al, [500h+bx]
        inc     bx
        cmp     bx, 05h
        jb      avg
        mov     [510h], al
        mov     [520h], bl
        mov     cl, bl
        div     cl
        mov     [530h], al
mostrar:
    mov 	dx, nl
	call	w_strng2
	cmp     al, 0Ah
    je      txt0
    cmp     al, 09h
    je      txt9
    cmp     al, 08h
    je      txt8
    cmp     al, 07h
    je      txt7
    cmp     al, 06h
    je      txt6
    cmp     al, 05h
    je      txt5
    cmp     al, 04h
    je      txt4
    cmp     al, 03h
    je      txt3
    cmp     al, 02h
    je      txt2
    cmp     al, 01h
    je      txt1
txt0:	
    mov 	dx, msg0
    jmp     comm
txt9:
	mov 	dx, msg9
    jmp     comm
txt8:
	mov 	dx, msg8
    jmp     comm
txt7:
	mov 	dx, msg7
    jmp     comm
txt6:
	mov 	dx, msg6
    jmp     comm
txt5:
	mov 	dx, msg5
    jmp     comm
txt4:
	mov 	dx, msg4
    jmp     comm
txt3:	
    mov 	dx, msg3
    jmp     comm
txt2:	
    mov 	dx, msg2
    jmp     comm
txt1:
	mov 	dx, msg1
    jmp     comm
	
comm:   
    call 	w_strng2
	call 	kb	; solo detenemos la ejecución
	int 	20h

input:
    call kb
    xor si, si

validate: 
    cmp si, 10h 
    je fail
    cmp al, [validacion+si]
    je finish
    inc si
    jmp validate

fail:
    call clear
    mov bl, 00001111b 
    mov dl, 3h 
    mov bp, msgNo 
    mov si, len
    call w_strng
    call input
finish: ret

clear:
    mov bl, 00000000b 
    mov dl, 3h 
    mov bp, msgNo 
    mov si, lenDos
    call w_strng
    ret

validateS:
    mov bl, 00000100b 
    mov dl, 3h 
    mov bp, msgS 
    mov si, lenS
    call w_strng
    call kb
    cmp al, "S" 
    jne validateS
    call clear
    ret
 
texto: 
    mov ah, 00h
    mov al, 03h
    int 10h
    ret


kb: 
    mov ah, 00h 
    int 16h 
    ret 
w_strng:
    mov ah, 13h
    mov al, 01h 
    mov bh, 00h 
    mov cx, si 
    mov dh, 0h
    push cs 
    pop es 
    int 10h
    ret
w_strng2:
    mov	ah, 09h
	int 	21h
	ret


section .data
validacion db "1234567890"      ;cadena donde debe estar el digito
msgNo db "No es numero"
len equ $-msgNo
msgS db "S para resultado"
lenS equ $-msgS
msgDos db "Ingrese carnet (5 digitos)"
lenDos equ $-msgDos

msg0 	db 	"Perfecto solo Dios$"
msg9 	db 	"Siempre me esfuerzo$"
msg8 	db 	"Colocho$"
msg7 	db 	"Muy bien$"
msg6 	db 	"Peor es nada$"
msg5 	db 	"En el segundo$"
msg4 	db 	"Me recupero$"
msg3 	db 	"Hay salud$"
msg2 	db 	"Aun se pasa$"
msg1 	db 	"Solo necesito el 0$"
nl	db 	0xA, 0xD, "$"