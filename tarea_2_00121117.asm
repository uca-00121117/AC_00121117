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
        ;dividiendo ax/cl (12/5)
        div cl
        ;resultado es: Cociente 2 Residuo 2
        ;Necesitamos cociente
        ;A u n   s e   p a s a
        ;1 2 3 4 5 6 7 8 9 A B 

        mov di ,0d
        mov cx ,[len]

comprobar: cmp al,0002h

lupi:   mov bl,[comnt2+di]
        mov [di+200h],  bl
        inc di
        loop lupi
        int 20h

;comprobamos que el cociente sea 2
      
section .data
    
    comnt2 db "Aun se pasa"
    len equ $-comnt2


  
;Ejercicio 2
;El presidente Bayib Nukele, de un país ficticio, necesita presentar datos de una proyección de casos de la pandemia COVID-19, para lo cual su equipo de expertos ha encontrado la maravillosa y precisa formula precisa: “comenzando con dos casos el día uno, cada tres días se duplica el número”. Usted es el encargado de las gráficas, tiene que dejar una buena impresión. De manera dinámica, coloque 11 estimaciones partiendo del día 3, de tres en tres es decir primera celda día 3, segunda día 6, y así; una estimación por cada una o dos celdas de memoria, desde la celda 210h llenando toda la fila, cuando pase de 255 necesitará usar dos celdas de memoria para guardar el número.




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
  




