open Rdflib

let _ =
  graph_query 
    "http://localhost:8880/openrdf-sesame/repositories/yoann" 
    "text/plain" 
    "construct {?s ?p ?o} where {?s ?p ?o} limit 15"
