
let rec assoc (d,k,l) =
  match l with | (x,y)::t when x = k -> y | h::t -> assoc d k | _ -> (-1);;


(* fix

let rec assoc (d,k,l) = match l with | h::t -> assoc (d, k, t);;

*)

(* changed spans
(3,2)-(3,73)
match l with
| h :: t -> assoc (d , k , t)
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG]))])

(3,40)-(3,41)
(d , k , t)
TupleG (fromList [VarG])

(3,52)-(3,61)
assoc (d , k , t)
AppG (fromList [TupleG (fromList [EmptyG])])

(3,69)-(3,73)
t
VarG

*)
