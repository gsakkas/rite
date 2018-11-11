
let rec listReverse l = match l with | [] -> l | h::t -> [listReverse t; h];;


(* fix

let rec listReverse l =
  match l with | [] -> l | h::t -> (listReverse t) @ [h];;

*)

(* changed spans
(2,57)-(2,75)
listReverse t @ [h]
AppG [AppG [EmptyG],ListG EmptyG Nothing]

(2,58)-(2,71)
(@)
VarG

(2,73)-(2,74)
[h]
ListG VarG Nothing

*)
