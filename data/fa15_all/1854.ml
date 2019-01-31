
let rec listReverse l = match l with | [] -> [] | h::t -> t @ h;;


(* fix

let rec listReverse l = match l with | [] -> [] | h::t -> t @ [h];;

*)

(* changed spans
(2,62)-(2,63)
[h]
ListG VarG Nothing

*)
