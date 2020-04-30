 ;Ejercicio 3
 ;Escriba de manera dinámica los primeros 16 números de la sucesión de Fibonacci, cada uno en una o dos celda de memoria, desde la celda 220h llenando toda la fila, cuando pase de 255 necesitará usar dos celdas de memoria para guardar el número. La sucesión obedece la siguiente formula:
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