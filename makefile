CC=gcc
SDIR=src
BDIR=bin
LDIR=lib

prog: $(SDIR)/prog.c libmylib.a
	$(CC) $(SDIR)/prog.c -L$(LDIR) -lmylib -o $(BDIR)/prog

calc.o: $(SDIR)/calc.c $(SDIR)/lib.h
	$(CC) -c $(SDIR)/calc.c -o $(LDIR)/calc.o

libmylib.a: calc.o
		ar rs $(LDIR)/libmylib.a $(LDIR)/calc.o

clean:
	rm $(BDIR)/prog
	rm $(LDIR)/libmylib.a
	rm $(LDIR)/calc.o