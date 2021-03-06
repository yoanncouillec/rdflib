open Rdflib

let _ =
  graph_query 
    "http://localhost:8880/openrdf-sesame/repositories/lodac" 
    "text/plain" 
    ("PREFIX foaf: <http://xmlns.com/foaf/0.1/> "^
       "CONSTRUCT {?uri a foaf:Person . "^
       "?uri foaf:name ?name . "^
       "} WHERE {"^
       "?uri a foaf:Person . "^
       "?uri foaf:name ?name . "^
       "} LIMIT 100")
