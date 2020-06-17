org 100h
section .text
clearall:           ;limpiamos todo lo que usamos
    mov al, 0d
    mov [400h], al
    mov [401h], al
    mov [402h], al
    mov [403h], al
    mov [404h], al
    mov [405h], al
    mov [406h], al
    mov [407h], al
    mov [408h], al
    mov [409h], al
    mov [40Ah], al


init:                   ;comenzamos con el mensaje inicial
    call texto 
    mov bl, 00001110b 
    mov dl, 3h 
    mov bp, msgDos 
    mov si, lenDos
    call w_strng

First:                      ;funcion donde pedimos primer dato
    xor si, si
    call input 
    mov [400h], al
    call clear
    call color
    call w_strng            ;mostramos el primer dato
Second:                     ;funcion donde pedimos el segundo dato
    mov al, "+"             ;concatenamos +
    mov [401h], al
    call input              ;pedimos el dato
    mov [402h], al
    call clear
    call color             
    call w_strng     
 Third:                     ;funcion donde pedimos el segundo dato
    mov al, "+"             ;concatenamos +
    mov [403h], al
    call input              ;pedimos el dato
    mov [404h], al
    call clear
    call color             
    call w_strng   
Fourth:                     ;funcion donde pedimos el segundo dato
    mov al, "+"             ;concatenamos +
    mov [405h], al
    call input              ;pedimos el dato
    mov [406h], al
    call clear
    call color             
    call w_strng   
fiveth:                     ;funcion donde pedimos el segundo dato
    mov al, "+"             ;concatenamos +
    mov [407h], al
    call input              ;pedimos el dato
    mov [408h], al
    call clear
    call color             
    call w_strng   
     
calc:                      
    call validateS         
    mov al, "="             
    mov [409h], al          
    call w_strng
    call kb
    
    int 20h
color:
    mov si, 12h
    mov bl, 00101110b ;atributos amarillo:1110 verde:0010
    mov dl, 30h ; columna inicial
    mov bp, 400h ; casilla inicial
avg:    
    add     al, [400h+bx]
    inc     bx
    inc     bx
    cmp     bx, 10h
    jb      avg
    mov     [410h], al
    mov     [420h], bl
    mov     cl, bl
    div     cl
    mov     [430h], al
suma:
    cmp al, "9"
    jle suma2
    sub al, 10d
    mov cl, "1"
    mov [414h], cl
    mov [415h], al
    ret
suma2:
    mov [414h], al
    ret

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



section .data
validacion db "1234567890"      ;cadena donde debe estar el digito
msgNo db "No es numero"
len equ $-msgNo
msgS db "S para resultado"
lenS equ $-msgS
msgDos db "Ingrese carnet (5 digitos)"
lenDos equ $-msgDos

msga 	db 	"Perfecto solo Dios$"
msgb 	db 	"Siempre me esfuerzo$"
msgc 	db 	"Colocho$"
msgd 	db 	"Muy bien$"
msge 	db 	"Peor es nada$"
msgf 	db 	"En el segundo$"
msgg 	db 	"Me recupero$"
msgh 	db 	"Hay salud$"
msgi 	db 	"Aun se pasa$"
msgj 	db 	"Solo necesito el 0$"
nl	db 	0xA, 0xD, "$"