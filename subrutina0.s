@@ Instituto Tecnologico de Tijuana
@@ Depto de Sistemas y Computacion
@@ Ing. En Sistemas Computacionales
@@ Autor: Kevin Enrique Figueroa Mazo @nickname: Kevinals75
@@ Fecha de revision: 9/12/21                                           

.data @letras
seed : .word 1
const1 : .word 1103515245
const2 : .word 12345

.text
.global myrand, mysrand
myrand : ldr r1, = seed @ leo puntero a semilla
	ldr r0, [ r1 ] @ leo valor de semilla
	ldr r2, [ r1, #4 ] @ leo const1 en r2
	mul r3, r0, r2 @ r3= seed * 1103515245
	ldr r0, [ r1, #8 ] @ leo const2 en r0
	add r0, r0, r3 @ r0= r3+ 12345
	str r0, [ r1 ] @ guardo en variable seed
/* Estas dos lí neas devuelven "seed > >16 & 0x7fff ".
Con un pequeño truco evitamos el uso del AND */
	LSL r0, # 1
	LSR r0, # 17
	bx lr
mysrand : ldr r1, = seed
	str r0, [ r1 ]
	bx lr