
let rec assoc (d,k,l) =
  match l with
  | [] -> d
  | h::t -> let f::e = h in if f = k then e else assoc d k t;;


(* fix

let rec assoc (d,k,l) =
  match l with | [] -> d | (n,m)::t -> if n = k then m else assoc (d, k, t);;

*)

(* changed spans
(3,3)-(5,61)
(5,13)-(5,61)
(5,24)-(5,25)
(5,32)-(5,33)
(5,43)-(5,44)
(5,50)-(5,55)
(5,50)-(5,61)
(5,56)-(5,57)
*)

(* type error slice
(2,4)-(5,63)
(2,16)-(5,61)
(5,50)-(5,55)
(5,50)-(5,61)
(5,56)-(5,57)
*)
