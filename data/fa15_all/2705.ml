
let rec assoc (d,k,l) =
  match l with
  | [] -> d
  | h::t -> let (a,b) = h in if a = k then b else assoc t;;


(* fix

let rec assoc (d,k,l) =
  match l with
  | [] -> d
  | h::t -> let (a,b) = h in if a = k then b else assoc (d, k, t);;

*)

(* changed spans
(5,56)-(5,57)
d
VarG

(5,56)-(5,57)
k
VarG

(5,56)-(5,57)
(d , k , t)
TupleG (fromList [VarG])

*)
