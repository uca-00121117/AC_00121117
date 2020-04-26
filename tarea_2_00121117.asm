org 100h
;Ejercicio 1 
;Carnet 00121117 ->21117
; Tomando como base los últimos 5 dígitos de su carnet, cada digito representa una de las notas de las evaluaciones que serán la nota del primer parcial de una materia ficticia, por medio de un promedio, calcule la nota de su primer parcial ficticio y escriba en la fila de celdas de memoria de 200h a 20Fh el comentario correspondiente:
section .text
;Iniciando en 0
    mov ax, 0000h
;Sumando numeros    

    add ax, 2d
    add ax, 1d
    add ax, 1d
    add ax, 1d
    add ax, 7d
    ; dando valor al total de numeros
    mov cl, 5d
    ; dividiendo ax/cl (12/5)
    div cl
    ; resultado es: Cociente 2 Residuo 2
    ; Necesitamos cociente
    ; A u n   s e   p a s a
    ; 1 2 3 4 5 6 7 8 9 A B 

    mov di ,0d
    mov cx,000h
    mov cx ,[len];     me da bucle
    mov cx , 11         ;longitud quemada 
    lupi:  
        mov bl,[comnt+di]
        mov [di+200h],  bl
        inc di
    loop lupi
;comprobamos que el cociente sea 2
section .data
    comnt db "Aun se pasa"
    len equ $-comnt
  
;Ejercicio 2
;El presidente Bayib Nukele, de un país ficticio, necesita presentar datos de una proyección de casos de la pandemia COVID-19, para lo cual su equipo de expertos ha encontrado la maravillosa y precisa formula precisa: “comenzando con dos casos el día uno, cada tres días se duplica el número”. Usted es el encargado de las gráficas, tiene que dejar una buena impresión. De manera dinámica, coloque 11 estimaciones partiendo del día 3, de tres en tres es decir primera celda día 3, segunda día 6, y así; una estimación por cada una o dos celdas de memoria, desde la celda 210h llenando toda la fila, cuando pase de 255 necesitará usar dos celdas de memoria para guardar el número.
        mov     ax, 0000h
        mov     al, 2d
        mov     bx, 210h
        mov     cx, 2d
est:    mul     cx
        mov     [bx], ax
        cmp     ah, 00h
        ja      two
        je      one
two:    add     bx, 2h
        jmp     sig
one:    add     bx, 1h
sig:    cmp     bx, 21Fh
        jb      est

 ;Ejercicio 3
        mov     cl, 0d          ;inicializando ax
        mov     [220h], cl      ;metiendo 0 en la primer casilla
        mov     cl, 1d          ;cambiando ax por 1
        mov     [221h], cl      ;poniendo 1 en casilla 2
        mov     bx, 222h        ;posicion de iniico ya que se "quemaron" los 2 primeros
fibonacci: mov     ax, 0h       ;comenzando proceso
        mov     [bx], ax        ;dando a bx lo que tiene  ax //primera iteracion ->222h = 0
        ;regresando a f-2
        sub     bx, 2h          ;restando 2 ala posicion // primera interaccion ->222h->220h
        mov     al, [bx]        ;dando a al [bx] -> a al le da en la primer interacion 0 (222h-2h)
        ;regresando a f-1
        add     bx, 1h          ;sumando 1 ala posicion bx//primera -> 220h->221h
        add     ax, [bx]        ;sumando a ax [bx]//Primera iteracion ax=0

        add     bx, 1h          ;sumando 1  a la posicion de  bx para regresar al actual 221h->222h
        mov     [bx], ax        ;dando a [bx]= ax -> 1 (posicion 221h)
        add     bx, 1h          ;sumando 1 a la posicion de  bx para regresar al actual 222h->223h
        cmp     bx, 22fh        ;comprobando que no sea la ultima casilla
        jb      fibonacci            ;saltando si es menor


int 20h



















;Como lo estaba haciendo 
;Ejercicio 1
   ;A u n   s e   p a s a
        ;1 2 3 4 5 6 7 8 9 A B 
;comprobar: cmp al,0002h
;comprobamos que el cociente sea 2
        ; mov  cl , 'A' 
        ; mov [200h],cl  
        ; mov  cl , 'u' 
        ; mov [202h],cl
        ; mov  cl , 'n' 
        ; mov [203h],cl
        ; mov  cl , ' ' 
        ; mov [201h],cl
        ; mov [204h],cl
        ; mov [207h],cl
        ; mov [20Ch],cl
        ; mov [20dh],cl
        ; mov [20eh],cl
        ; mov [20fh],cl

        ; mov  cl , 'p' 
        ; mov [208h],cl
        ; mov  cl , 'a' 
        ; mov [209h],cl
        ; mov [20Bh],cl
        ; mov  cl , 's' 
        ; mov [20Ah],cl       
        ; mov [205h],cl     
        ; mov cl , 'e'
        ; mov [206h],cl       
  




