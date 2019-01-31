
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
(3,8)-(3,14)
[(k , d)]
ListG (TupleG (fromList [EmptyG])) Nothing

(5,24)-(5,25)
h
VarG

*)
