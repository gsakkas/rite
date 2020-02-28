
let rec assoc (d,k,l) =
  match (k, d) with
  | [] -> d
  | h::t -> if (k, d) = l then d else assoc (d, k, t);;


(* fix

let rec assoc (d,k,l) =
  match [(k, d)] with
  | [] -> d
  | h::t -> if (k, d) = h then d else assoc (d, k, t);;

*)

(* changed spans
(3,9)-(3,15)
[(k , d)]
ListG [TupleG [EmptyG,EmptyG]]

(5,25)-(5,26)
h
VarG

*)

(* type error slice
(3,3)-(5,54)
(3,9)-(3,15)
*)
