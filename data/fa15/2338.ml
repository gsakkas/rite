
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
(5,44)-(5,47)
s
VarG

(5,53)-(5,64)
assoc (d , k , t)
AppG [TupleG [EmptyG,EmptyG,EmptyG]]

*)

(* type error slice
(2,4)-(5,66)
(2,16)-(5,64)
(5,13)-(5,64)
(5,25)-(5,26)
(5,44)-(5,45)
(5,44)-(5,47)
(5,46)-(5,47)
(5,53)-(5,58)
(5,53)-(5,64)
(5,59)-(5,60)
*)
