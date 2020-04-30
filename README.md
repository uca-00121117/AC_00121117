# AC_00121117

# comandos

nasm -f bin 3.asm -o T3_2.COM

bosbox .

# Tarea 2
La tarea consiste en 3 ejercicios, que serán entregados un solo archivo, con nombre tarea_n_carnet.asm donde n es el número de la tarea y carnet es su carnet. Tendrán que subirlo a un repositorio del VCS de su preferencia (e.g. GitHub), el nombre del repositorio será AC_carnet donde carnet es su carnet; Los exhorto a no realizar un solo commit final, sino que progresivamente vayan marcando su progreso con commits bien documentados. Este será el repositorio donde subiremos todos nuestros archivos de tareas de laboratorio, trátenlo bien.

Hora y fecha limite: 23:58 del Domingo 26 de Abril

Definición formal

### Ejercicio 1. 
Tomando como base los últimos 5 dígitos de su carnet, cada digito representa una de las notas de las evaluaciones que serán la nota del primer parcial de una materia ficticia, por medio de un promedio, calcule la nota de su primer parcial ficticio y escriba en la fila de celdas de memoria de 200h a 20Fh el comentario correspondiente:

10 = “Perfecto solo Dios”                                         5 = “En el segundo”

9 = “Siempre me esfuerzo”                                    4 = “Me recupero”

8 = “Colocho”                                                             3 = “Hay salud”

7 = “Muy bien”                                                            2 = “Aun se pasa”

6 = “Peor es nada”                                                   1 = “Solo necesito el 0”

Ejemplo de como escribir dinamicamente (Más en https://nasm.us/doc/nasmdoc3.html#section-3.2.4)



### Ejercicio 2.
El presidente Bayib Nukele, de un país ficticio, necesita presentar datos de una proyección de casos de la pandemia COVID-19, para lo cual su equipo de expertos ha encontrado la maravillosa y precisa formula precisa: “comenzando con dos casos el día uno, cada tres días se duplica el número”. Usted es el encargado de las gráficas, tiene que dejar una buena impresión. De manera dinámica, coloque 11 estimaciones partiendo del día 3, de tres en tres es decir primera celda día 3, segunda día 6, y así; una estimación por cada una o dos celdas de memoria, desde la celda 210h llenando toda la fila, cuando pase de 255 necesitará usar dos celdas de memoria para guardar el número.

Resultado esperado

### Ejercicio 3.
Escriba de manera dinámica los primeros 16 números de la sucesión de Fibonacci, cada uno en una o dos celda de memoria, desde la celda 220h llenando toda la fila, cuando pase de 255 necesitará usar dos celdas de memoria para guardar el número. La sucesión obedece la siguiente formula:

{\displaystyle F_{0}=0,\quad F_{1}=1,}  

{\displaystyle F_{n}=F_{n-1}+F_{n-2},}

para n>1
Resultado esperado 