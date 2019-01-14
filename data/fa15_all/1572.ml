
let rec listReverse l =
  match l with | [] -> l | hd::tail -> (listReverse tail) @ hd;;


(* fix

let rec listReverse l =
  match l with | [] -> l | hd::tail -> (listReverse tail) @ [hd];;

*)

(* changed spans
(3,60)-(3,62)
[hd]
ListG VarG Nothing

*)
