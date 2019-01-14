
let rec assoc (d,k,l) =
  match l with
  | [] -> d
  | h::t -> let (f,s) = h in if k = f then s h else assoc d k t;;


(* fix

let rec assoc (d,k,l) =
  match l with
  | [] -> d
  | h::t -> let (f,s) = h in if k = f then s else assoc (d, k, t);;

*)

(* changed spans
(5,52)-(5,63)
assoc (d , k , t)
AppG (fromList [TupleG (fromList [EmptyG])])

(5,58)-(5,59)
(d , k , t)
TupleG (fromList [VarG])

*)
