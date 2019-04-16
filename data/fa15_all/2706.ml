
let rec assoc (d,k,l) =
  match l with
  | [] -> d
  | h::t -> let (a,b) = h in if a = k then b else assoc d k t;;


(* fix

let rec assoc (d,k,l) =
  match l with
  | [] -> d
  | h::t -> let (a,b) = h in if a = k then b else assoc (d, k, t);;

*)

(* changed spans
(5,51)-(5,62)
assoc (d , k , t)
AppG (fromList [TupleG (fromList [EmptyG])])

*)

(* type error slice
(2,4)-(5,64)
(2,16)-(5,62)
(5,51)-(5,56)
(5,51)-(5,62)
(5,57)-(5,58)
*)
