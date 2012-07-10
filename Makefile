test: string2.cmo rdflib.cmo test.ml
	ocamlc unix.cma str.cma $^ -o $@

%.cmo: %.ml
	ocamlc -c $^ -o $@

c:
	rm -rf *.cm* test *~
