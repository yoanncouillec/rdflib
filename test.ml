open Rdflib

let _ =
  graph_query 
    "http://dbpedia.org:80/sparql" 
    "application/x-binary-rdf" 
    "construct {?s a <http://dbpedia.org/ontology/Artist>} where {?s a <http://dbpedia.org/ontology/Artist>}"
  (* graph_query 
    "http://localhost:8880/openrdf-sesame/repositories/yoann" 
    "text/plain" 
    "construct {?s ?p ?o} where {?s ?p ?o} limit 15" *)
