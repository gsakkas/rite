
let rec assoc (d,k,l) = match l with | h::t -> assoc d k t;;


(* fix

let rec assoc (d,k,l) = match l with | h::t -> assoc (d, k, t);;

*)

(* changed spans
(2,47)-(2,58)
assoc (d , k , t)
AppG (fromList [TupleG (fromList [EmptyG])])

(2,53)-(2,54)
(d , k , t)
TupleG (fromList [VarG])

*)
