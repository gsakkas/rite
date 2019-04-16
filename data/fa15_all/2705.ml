
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
(5,57)-(5,58)
(d , k , t)
TupleG (fromList [VarG])

*)

(* type error slice
(2,4)-(5,60)
(2,16)-(5,58)
(3,3)-(5,58)
(5,51)-(5,56)
(5,51)-(5,58)
(5,57)-(5,58)
*)
