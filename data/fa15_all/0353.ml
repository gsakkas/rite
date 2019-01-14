
let rec assoc (d,k,l) =
  match l with
  | (x,y)::t when x = k -> y
  | (x,y)::t -> assoc d k t
  | _ -> (-1);;


(* fix

let rec assoc (d,k,l) = match l with | h::t -> assoc (d, k, t);;

*)

(* changed spans
(3,2)-(6,13)
match l with
| h :: t -> assoc (d , k , t)
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG]))])

(4,27)-(4,28)
(d , k , t)
TupleG (fromList [VarG])

(5,16)-(5,27)
assoc (d , k , t)
AppG (fromList [TupleG (fromList [EmptyG])])

*)
