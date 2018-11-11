
let rec append l1 l2 = match l1 with | [] -> l2 | h::t -> h :: (append t l2);;

let rec listReverse l =
  match l with | [] -> [] | h::t -> append listReverse t [h];;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

*)

(* changed spans
(5,36)-(5,42)
listReverse t @ [h]
AppG [AppG [EmptyG],ListG EmptyG Nothing]

(5,43)-(5,54)
(@)
VarG

(5,43)-(5,54)
listReverse t
AppG [VarG]

*)
