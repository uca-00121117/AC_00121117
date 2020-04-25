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






