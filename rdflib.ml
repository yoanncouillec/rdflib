open String2

let read_status ic =
  let s = clean_newline (input_line ic) in
  let regex = Str.regexp "\\(HTTP/[0-9][.][0-9]\\) \\([0-9]+\\) \\(.*\\)" in
  let _ = Str.search_forward regex s 0 in
  let x = (Str.matched_group 1 s) in
  let y = (Str.matched_group 2 s) in
  let z = (Str.matched_group 3 s) in
    (x,y,z)

let read_header s = 
  let regex = Str.regexp "\\([a-zA-Z-]+\\):[ ]*\\(.*\\)" in
  let _ = Str.search_forward regex s 0 in
  let x = (Str.matched_group 1 s) in
  let y = (Str.matched_group 2 s) in
    (x,y)

let read_headers ic =
  let rec read_headers (acc : (string * string) list) = 
    let l = clean_newline (input_line ic) in
      if l = "" then begin acc end
      else read_headers ((read_header l) :: acc)
  in
    read_headers []

let has_value l s =
  let rec has_value = function
    | [] -> false
    | (k,v) :: rest ->
	if k = s then true else has_value rest
  in
    has_value l

let get_value l s =
  let rec get_value = function
    | [] -> raise Not_found
    | (k,v) :: rest ->
	if k = s then v else get_value rest
  in
    get_value l
  
let read ic content length = 
  let rec read pos length = 
    let r = input ic content pos length in
      if r < length then read (pos + r) (length - r)
  in
    read 0 length

let read_hexa ic = int_of_string ("0x" ^ (clean_newline (input_line ic)))

let graph_query endpoint format query =
  let regex = Str.regexp "http://\\([a-zA-Z.]+\\):\\([0-9]+\\)\\(/.*\\)" in
  let _ = Str.search_forward regex endpoint 0 in
  let domain = (Str.matched_group 1 endpoint) in
  let port = int_of_string (Str.matched_group 2 endpoint) in
  let path = Str.matched_group 3 endpoint in
  let host = Unix.gethostbyname domain in
  let (ic,oc) = Unix.open_connection (
    Unix.ADDR_INET ((host.Unix.h_addr_list.(0)) , port)) in
  let data = "POST "^path^"?query="^(encode_url query)^" HTTP/1.1\nHost: "^
    domain^"\nContent-type: application/x-www-form-urlencoded;charset=UTF-8\nAccept: "^
    format^"\n\n" in
    output_string oc data ;
    flush oc ;
    let _ = read_status ic in
    let headers = read_headers ic in
      (* begin
	match status with 
	  | (version, code, text) ->
	      print_endline version; 
	      print_endline code; 
	      print_endline text 
      end ;
      List.iter (fun (a,b) -> print_endline ("("^a^","^b^")")) headers ; *)
      if has_value headers "Content-Length" then
	begin
	  let length = int_of_string (get_value headers "Content-Length") in
	  let content = (String.create length) in
	    read ic content length ;
	    print_string content
	end
      else
	begin
	  let length = read_hexa ic in
	  let content = (String.create length) in
	    read ic content length ;
	    print_string content
	end ;
      (* while true do print_char (input_char ic) ;flush stdout done ; *)
      Unix.shutdown_connection ic
