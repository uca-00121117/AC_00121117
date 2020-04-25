;Ejercicio 1 
;Carnet 00121117 ->21117
; Tomando como base los últimos 5 dígitos de su carnet, cada digito representa una de las notas de las evaluaciones que serán la nota del primer parcial de una materia ficticia, por medio de un promedio, calcule la nota de su primer parcial ficticio y escriba en la fila de celdas de memoria de 200h a 20Fh el comentario correspondiente:

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
        ;dividiendo ax/cl (12/5)
        div cl
        ;resultado es: Cociente 2 Residuo 2
        ;Necesitamos cociente
        ;A u n   s e   p a s a
        ;1 2 3 4 5 6 7 8 9 A B 
comprobar: cmp al,0002h;comprobamos que el cociente sea 2
        mov  cl , 'A' 
        mov [200h],cl  
        mov  cl , 'u' 
        mov [202h],cl
        mov  cl , 'n' 
        mov [203h],cl
        mov  cl , ' ' 
        mov [204h],cl
        mov [207h],cl
        mov  cl , 'p' 
        mov [208h],cl
        mov  cl , 'a' 
        mov [209h],cl
        mov [20Bh],cl
        mov  cl , 's' 
        mov [20Ah],cl       
        mov [205h],cl     
        mov cl , 'e'
        mov [206h],cl       
  





int 20h





