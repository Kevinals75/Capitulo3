@@ Instituto Tecnologico de Tijuana
@@ Depto de Sistemas y Computacion
@@ Ing. En Sistemas Computacionales
@@ Autor: Kevin Enrique Figueroa Mazo @nickname: Kevinals75
@@ Fecha de revision: 9/12/21                                           

.data
var1   : .asciz "%d \n"
seed   : .word  1
const1 : .word  1103515245
const2 : .word  12345

.text
.global main

/* Salvamos registros */
main:   push    { r4, lr }

/* Llamamos a mysrand con parámetro 42 */
        mov     r0, # 42
        bl      mysrand
/* Inicializamos contador de bucle en r4 */
        mov     r4, # 5
/* Bucle que imprime 5 nú meros aleatorios */
bucle:  bl       myrand
        mov      r1, r0 
        ldr      r0, = var1
        bl       printf
        subs     r4, r4, #1 
        bne      bucle 
/*Recupera el dato de la pila*/
        pop { r4, lr } 
        bx lr /*Vía de comunicación*/
        myrand : ldr r1, = seed
        ldr r0, [ r1 ]
        ldr r2, [ r1, #4 ]
/*Multiplicación sin signo*/
        mul r3, r0, r2 
        ldr r0, [ r1, #8 ]
/*Adición de los operandos.*/
        add r0, r0, r3
        str r0, [ r1 ]
/*Transfiere datos entre celdas de memoria*/
        mov r0, r0, LSL #1
        mov r0, r0, LSR # 17
        bx lr

mysrand: ldr r1, = seed
         str r0, [ r1 ]
         bx lr



