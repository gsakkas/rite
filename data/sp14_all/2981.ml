
let rec app l1 l2 = match l1 with | [] -> l2 | h::t -> h :: (app t l2);;

let rec digitsOfInt n =
  if n >= 10 then app (digitsOfInt (n / 10) [n mod 10]) else [n];;


(* fix

let rec app l1 l2 = match l1 with | [] -> l2 | h::t -> h :: (app t l2);;

let rec digitsOfInt n = if n >= 10 then app [5] [n mod 10] else app [3] [8];;

*)

(* changed spans
(5,19)-(5,56)
app [5] [n mod 10]
AppG [ListG [EmptyG],ListG [EmptyG]]

(5,62)-(5,65)
app [3] [8]
AppG [ListG [EmptyG],ListG [EmptyG]]

*)

(* type error slice
(2,61)-(2,71)
(2,62)-(2,65)
(4,4)-(5,67)
(4,21)-(5,65)
(5,3)-(5,65)
(5,19)-(5,22)
(5,19)-(5,56)
(5,23)-(5,56)
(5,24)-(5,35)
(5,62)-(5,65)
*)
