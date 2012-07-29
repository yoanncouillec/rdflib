EXEC = test1.out test2.out test3.out
all:$(EXEC)

%.out: string2.cmx rdflib.cmx %.ml
	ocamlopt unix.cmxa str.cmxa $^ -o $@

%.cmx: %.ml
	ocamlopt -c $^ -o $@

clean:
	rm -rf *.cm* $(EXEC) *~ *.o
