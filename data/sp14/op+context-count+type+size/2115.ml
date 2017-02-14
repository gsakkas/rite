
let rec app l1 l2 = match l1 with | [] -> l2 | h::t -> h :: (app t l2);;

let rec digitsOfInt n =
  if n >= 10 then app (digitsOfInt (n / 10) [n mod 10]) else app [n] [];;


(* fix

let rec app l1 l2 = match l1 with | [] -> l2 | h::t -> h :: (app t l2);;

let rec digitsOfInt n = if n >= 10 then app [5] [n mod 10] else app [3] [8];;

*)

(* changed spans
(5,18)-(5,21)
(5,18)-(5,55)
(5,23)-(5,34)
(5,35)-(5,43)
(5,36)-(5,37)
(5,40)-(5,42)
(5,45)-(5,53)
(5,66)-(5,67)
(5,69)-(5,71)
*)

(* type error slice
(5,2)-(5,71)
(5,2)-(5,71)
(5,18)-(5,21)
(5,18)-(5,55)
(5,61)-(5,64)
(5,61)-(5,71)
*)
