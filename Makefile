SCIPY_SPECIAL=scipy/special
CEPHES=$(SCIPY_SPECIAL)/cephes
CFLAGS+=-I /usr/include/python3.6 -I /usr/lib/python3/dist-packages/numpy/core/include -I $(SCIPY_SPECIAL) -Wall

CXXFLAGS=-I $(SCIPY_SPECIAL)

# curiously, g++ does not need -lm (but gcc does)

fresnl-test: fresnl.o

fresnl.o: $(CEPHES)/fresnl.c
	$(CC) -c $(CFLAGS) $<


.PHONY: clean
clean:
	rm -f fresnl.o fresnl-test

.PHONY: all
all: fresnl-test

fresnl-test: $(SCIPY_SPECIAL)/cephes.h

fresnl.o: $(CEPHES)/mconf.h \
 $(CEPHES)/cephes_names.h \
 $(CEPHES)/polevl.h \
 $(SCIPY_SPECIAL)/sf_error.h \
 $(SCIPY_SPECIAL)/cephes.h
