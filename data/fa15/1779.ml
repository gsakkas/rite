
let rec assoc (d,k,l) =
  match l with
  | [] -> d
  | h::l' -> (match h with | (a,b) -> if a = k then b assoc (d, k, l'));;


(* fix

let rec assoc (d,k,l) =
  match l with
  | [] -> d
  | h::l' -> (match h with | (a,b) -> if a = k then b else assoc (d, k, l'));;

*)

(* changed spans
(5,53)-(5,71)
b
VarG

(5,71)-(5,71)
assoc (d , k , l')
AppG [TupleG [EmptyG,EmptyG,EmptyG]]

*)

(* type error slice
(3,3)-(5,72)
(5,14)-(5,72)
(5,21)-(5,22)
(5,53)-(5,54)
(5,53)-(5,71)
(5,61)-(5,71)
(5,68)-(5,70)
*)
