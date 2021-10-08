@echo off
mkdir bin
mkdir src
mkdir lib
cd src
echo #include ^<stdio.h^> > prog.c
echo #include "lib.h" >> prog.c
echo. >> prog.c
echo int main() { >> prog.c
echo   return 0; >> prog.c
echo } >> prog.c

echo #ifndef LIB_H > lib.h
echo #define LIB_H >> lib.h
echo. >> lib.h
echo #include ^<stdio.h^> >> lib.h
echo. >> lib.h
echo /* Make #define here */ >> lib.h
echo. >> lib.h
echo /* Define function definitions here: int sum(int *array, int size); etc. */ >> lib.h
cd..
echo CC=gcc> makefile
echo SDIR=src>> makefile
echo BDIR=bin>> makefile
echo LDIR=lib>> makefile
echo.>> makefile
echo prog: $(SDIR)/prog.c lib.a>> makefile
echo 	$(CC) $(SDIR)/prog.c -L$(LDIR) -llib -o $(BDIR)/prog>> makefile
echo.>> makefile
echo sum.o: $(SDIR)/sum.c $(SDIR)/lib.h>> makefile
echo 	$(CC) -c $(SDIR)/sum.c -o $(LDIR)/sum.o>> makefile
echo show.o: $(SDIR)/show.c $(SDIR)/lib.h>> makefile
echo 	$(CC) -c $(SDIR)/show.c -o $(LDIR)/show.o>> makefile
echo.>> makefile
echo lib.a: show.o sum.o >> makefile
echo 	ar rs $(LDIR)/lib.a $(LDIR)/sum.o $(LDIR)/show.o>> makefile
echo.>> makefile
echo clean:>> makefile
echo 	rm $(BDIR)/prog>> makefile
echo 	rm $(LDIR)/lib.a>> makefile
echo 	rm $(LDIR)/sum.o>> makefile
echo 	rm $(LDIR)/show.o>> makefile