open Rdflib

let _ =
  graph_query 
    "http://dbpedia.org:80/sparql" 
    "application/x-turtle" 
    ("construct {"^
       "<http://dbpedia.org/resource/Claude_Monet> a ?t . "^
       "<http://dbpedia.org/resource/Claude_Monet> <http://www.w3.org/2000/01/rdf-schema#label> ?n1 . "^
       "<http://dbpedia.org/resource/Claude_Monet> <http://xmlns.com/foaf/0.1/givenName> ?n2 . "^
       "<http://dbpedia.org/resource/Claude_Monet> <http://xmlns.com/foaf/0.1/surname> ?n3 . "^
       "<http://dbpedia.org/resource/Claude_Monet> <http://xmlns.com/foaf/0.1/name> ?n4 . "^
       "<http://dbpedia.org/resource/Claude_Monet> <http://dbpedia.org/property/name> ?n5 . "^
       "<http://dbpedia.org/resource/Claude_Monet> <http://dbpedia.org/property/birthName> ?n6 . "^
       "<http://dbpedia.org/resource/Claude_Monet> <http://dbpedia.org/property/birthDate> ?d1 . "^
       "<http://dbpedia.org/resource/Claude_Monet> <http://dbpedia.org/property/deathDate> ?d2 . "^
       "<http://dbpedia.org/resource/Claude_Monet> <http://dbpedia.org/property/dateOfBirth> ?d3 . "^
       "<http://dbpedia.org/resource/Claude_Monet> <http://dbpedia.org/property/dateOfDeath> ?d4 . "^
       "<http://dbpedia.org/resource/Claude_Monet> <http://dbpedia.org/ontology/birthDate> ?d5 . "^
       "<http://dbpedia.org/resource/Claude_Monet> <http://dbpedia.org/ontology/deathDate> ?d6 . "^
       "} where {"^
       "<http://dbpedia.org/resource/Claude_Monet> a ?t . "^
       "<http://dbpedia.org/resource/Claude_Monet> <http://www.w3.org/2000/01/rdf-schema#label> ?n1 . "^
       "<http://dbpedia.org/resource/Claude_Monet> <http://xmlns.com/foaf/0.1/givenName> ?n2 . "^
       "<http://dbpedia.org/resource/Claude_Monet> <http://xmlns.com/foaf/0.1/surname> ?n3 . "^
       "<http://dbpedia.org/resource/Claude_Monet> <http://xmlns.com/foaf/0.1/name> ?n4 . "^
       "<http://dbpedia.org/resource/Claude_Monet> <http://dbpedia.org/property/name> ?n5 . "^
       "<http://dbpedia.org/resource/Claude_Monet> <http://dbpedia.org/property/birthName> ?n6 . "^
       "<http://dbpedia.org/resource/Claude_Monet> <http://dbpedia.org/property/birthDate> ?d1 . "^
       "<http://dbpedia.org/resource/Claude_Monet> <http://dbpedia.org/property/deathDate> ?d2 . "^
       "<http://dbpedia.org/resource/Claude_Monet> <http://dbpedia.org/property/dateOfBirth> ?d3 . "^
       "<http://dbpedia.org/resource/Claude_Monet> <http://dbpedia.org/property/dateOfDeath> ?d4 . "^
       "<http://dbpedia.org/resource/Claude_Monet> <http://dbpedia.org/ontology/birthDate> ?d5 . "^
       "<http://dbpedia.org/resource/Claude_Monet> <http://dbpedia.org/ontology/deathDate> ?d6 . "^
       " }")
