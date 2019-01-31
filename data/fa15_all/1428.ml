
let rec listReverse l = match l with | h::t -> listReverse h | [] -> [];;


(* fix

let rec listReverse l = match l with | h::t -> listReverse [h] | [] -> [];;

*)

(* changed spans
(2,59)-(2,60)
[h]
ListG VarG Nothing

*)
