
let rec assoc (d,k,l) =
  match l with
  | [] -> d
  | h::t -> let f::e = h in if f = k then e else assoc d k t;;


(* fix

let rec assoc (d,k,l) =
  match l with | [] -> d | (n,m)::t -> if n = k then m else assoc (d, k, t);;

*)

(* changed spans
(3,2)-(5,60)
(5,12)-(5,60)
(5,23)-(5,24)
(5,31)-(5,32)
(5,42)-(5,43)
(5,49)-(5,54)
(5,49)-(5,60)
(5,55)-(5,56)
*)

(* type error slice
(2,3)-(5,62)
(2,15)-(5,60)
(5,49)-(5,54)
(5,49)-(5,60)
(5,55)-(5,56)
*)
