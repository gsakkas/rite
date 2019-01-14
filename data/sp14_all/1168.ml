
let rec listReverse l = match l with | [] -> [] | a::b::[] -> 0;;


(* fix

let rec listReverse l = match l with | [] -> [] | a::b::[] -> [a];;

*)

(* changed spans
(2,62)-(2,63)
[a]
ListG VarG Nothing

*)
