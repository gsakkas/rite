
let rec assoc (d,k,l) = match l with | h::t -> assoc d k t;;


(* fix

let rec assoc (d,k,l) = match l with | h::t -> assoc (d, k, t);;

*)

(* changed spans
(2,48)-(2,59)
assoc (d , k , t)
AppG (fromList [TupleG (fromList [EmptyG])])

*)

(* type error slice
(2,4)-(2,61)
(2,16)-(2,59)
(2,48)-(2,53)
(2,48)-(2,59)
(2,54)-(2,55)
*)
