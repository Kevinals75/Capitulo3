
subrutina: subrutina.o
        g++ subrutina.o -o subrutina
subrutina.o: subrutina.s
        as -g -o subrutina.o subrutina.s
clean:
        rm subrutina subrutina.o


