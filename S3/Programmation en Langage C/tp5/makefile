prog: main_liste.o liste.o
	gcc main_liste.o liste.o -o prog
main_liste.o: main_liste.c liste.h
	gcc -c main_liste.c
liste.o: liste.c
	gcc -c liste.c
clean :
	rm -f *.o
