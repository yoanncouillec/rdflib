open Rdflib

let _ =
  graph_query 
    "http://dbpedia.org:80/sparql" 
    "text/plain" 
    ("construct {?s a <http://xmlns.com/foaf/0.1/Person>}"^
       " where {?s a <http://xmlns.com/foaf/0.1/Person> } limit 15")
