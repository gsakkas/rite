
let rec listReverse l =
  match l with | [] -> [] | h::t -> [t] @ (listReverse h);;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

*)

(* changed spans
(3,55)-(3,56)
t
VarG

(3,55)-(3,56)
[h]
ListG VarG Nothing

*)
