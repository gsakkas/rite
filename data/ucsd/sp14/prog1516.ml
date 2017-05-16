
let prefix130 = "130";;

type result =
  | Pass
  | Fail
  | ErrorCode of string;;

let rec compare a b =
  match a with
  | [] -> if b == [] then true else false
  | h::t ->
      (match b with
       | [] -> false
       | h2::t2 -> if h == h2 then compare t t2 else false);;

let print130 s = print_string (prefix130 ^ (">>" ^ s));;

let runWTimeout (f,arg,out,time) =
  try if (compare (f arg) out) = 0 then Pass else Fail
  with
  | e ->
      (print130 ("Uncaught Exception: " ^ (Printexc.to_string e));
       ErrorCode "exception");;
