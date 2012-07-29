EXEC = examples/test1.out examples/test2.out examples/test3.out
all: rdflib.cma rdflib.cmxa

%.out: string2.cmx rdflib.cmx %.ml
	ocamlopt unix.cmxa str.cmxa $^ -o $@

%.cmx: %.ml
	ocamlopt -c $^ -o $@

%.cma: %.ml
	ocamlc -a $^ -o $@

%.cmxa: %.ml
	ocamlopt -a $^ -o $@

check: $(EXEC)

install: $(LIB)
	cp rdflib.cma /usr/local/lib/ocaml
	cp rdflib.cmxa /usr/local/lib/ocaml
	cp rdflib.cmx /usr/local/lib/ocaml
	cp rdflib.cmi /usr/local/lib/ocaml
	cp rdflib.a /usr/local/lib/ocaml

uninstall:
	rm /usr/local/lib/ocaml/rdflib.cma
	rm /usr/local/lib/ocaml/rdflib.cmxa
	rm /usr/local/lib/ocaml/rdflib.cmx
	rm /usr/local/lib/ocaml/rdflib.cmi
	rm /usr/local/lib/ocaml/rdflib.a

clean:
	rm -rf *.cm* $(EXEC) *~ *.o *.a examples/*.cm* examples/*.o
