
let rec app l1 l2 = match l1 with | [] -> l2 | h::t -> h :: (app t l2);;

let rec digitsOfInt n =
  if n >= 10 then app (digitsOfInt (n / 10) [n mod 10]) else app [n] [];;


(* fix

let rec app l1 l2 = match l1 with | [] -> l2 | h::t -> h :: (app t l2);;

let rec digitsOfInt n = if n >= 10 then app [5] [n mod 10] else app [3] [8];;

*)

(* changed spans
(5,19)-(5,22)
(5,19)-(5,55)
(5,24)-(5,35)
(5,37)-(5,38)
(5,37)-(5,43)
(5,41)-(5,43)
(5,46)-(5,54)
(5,67)-(5,68)
(5,70)-(5,72)
*)

(* type error slice
(5,3)-(5,72)
(5,3)-(5,72)
(5,19)-(5,22)
(5,19)-(5,55)
(5,62)-(5,65)
(5,62)-(5,72)
*)
