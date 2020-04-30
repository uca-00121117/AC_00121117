;Ejercicio 2
;El presidente Bayib Nukele, de un país ficticio, necesita presentar datos de una proyección de casos de la pandemia COVID-19, para lo cual su equipo de expertos ha encontrado la maravillosa y precisa formula precisa: “comenzando con dos casos el día uno, cada tres días se duplica el número”. Usted es el encargado de las gráficas, tiene que dejar una buena impresión. De manera dinámica, coloque 11 estimaciones partiendo del día 3, de tres en tres es decir primera celda día 3, segunda día 6, y así; una estimación por cada una o dos celdas de memoria, desde la celda 210h llenando toda la fila, cuando pase de 255 necesitará usar dos celdas de memoria para guardar el número.
        mov     ax, 0d   ;comenzando
        mov     al, 2d      ;dando valor de 2 a al 
        mov     bx, 210h    ;dando el inicio del bucle 2
        mov     cx, 2d      ;dando a cx el valos de 2
est:    mul     cx          ;multiplicando a ax cx (2*2)
        mov     [bx], ax    ;dando a la posicion 210h el resultado de ax*cx
        cmp     ah, 00h     ;se le resta a ah
        ja      dos         ;salta a dos
        je      uno         ;salta a uno
        ;Condicion 2 
dos:    add     bx, 2h      ;suma a bx 2(posicion) 
        jmp     sig         ;salta a siguiente
        ;Condicion 1
uno:    add     bx, 1h      ;sumando 1 en la posicion bx
        ;salto hacia este paso
sig:    cmp     bx, 21Fh    ;restando bx y 21Fh(posicion final)
        jb      est         ;salto

        int 20h