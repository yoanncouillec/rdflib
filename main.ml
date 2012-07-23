(* main -i request.rq -o output -h http://dbpedia.org/sparql -p 80 *)

open Rdflib

let _ = 
  let request_filename = ref "" in
  let output_filename = ref "" in
  let host = ref "" in
  let port = ref 80 in
  let options =
    [
      "-i", Arg.Set_string request_filename, "Set request file";
      "-o", Arg.Set_string output_filename , "Set output file";
      "-h", Arg.Set_string host, "Set host name";
      "-p", Arg.Set_int port, "Set port";
    ]
  in
    Arg.parse options (fun x -> ()) "Options: ";          
