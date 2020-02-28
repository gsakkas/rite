
let rec app l1 l2 = match l1 with | [] -> l2 | h::t -> h :: (app t l2);;

let rec digitsOfInt n =
  if n >= 10 then app digitsOfInt (n / 10) [n mod 10] else app [3] [8];;


(* fix

let rec app l1 l2 = match l1 with | [] -> l2 | h::t -> h :: (app t l2);;

let rec digitsOfInt n =
  if n >= 10 then app (digitsOfInt (n / 10)) [n mod 10] else app [3] [8];;

*)

(* changed spans
(5,19)-(5,54)
app (digitsOfInt (n / 10))
    [n mod 10]
AppG [AppG [EmptyG],ListG [EmptyG]]

*)

(* type error slice
(2,56)-(2,71)
(2,61)-(2,71)
(2,62)-(2,65)
(4,4)-(5,73)
(4,21)-(5,71)
(5,19)-(5,22)
(5,19)-(5,54)
(5,23)-(5,34)
(5,60)-(5,63)
(5,60)-(5,71)
(5,64)-(5,67)
*)
