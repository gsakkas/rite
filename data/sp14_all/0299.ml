
let rec listReverse l = match l with | [] -> l | h::t -> h;;


(* fix

let rec listReverse l = match l with | [] -> l | h::t -> [h];;

*)

(* changed spans
(2,57)-(2,58)
[h]
ListG VarG Nothing

*)
