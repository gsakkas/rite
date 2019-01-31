
let rec assoc (d,k,l) = match l with | h::t -> assoc d k t | _ -> d;;


(* fix

let rec assoc (d,k,l) = match l with | h::t -> assoc (d, k, t);;

*)

(* changed spans
(2,24)-(2,67)
match l with
| h :: t -> assoc (d , k , t)
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG]))])

(2,47)-(2,58)
assoc (d , k , t)
AppG (fromList [TupleG (fromList [EmptyG])])

(2,53)-(2,54)
(d , k , t)
TupleG (fromList [VarG])

*)
