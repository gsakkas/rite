
let rec append l r = match l with | [] -> r | h::t -> h :: (append t r);;

let rec digitsOfInt n =
  if n <= 0 then [n] else ((append digitsOfInt (n / 10)), [n mod 10]);;


(* fix

let rec append l r = match l with | [] -> r | h::t -> h :: (append t r);;

let rec digitsOfInt n =
  if n <= 0 then [n] else append (digitsOfInt (n / 10)) [n mod 10];;

*)

(* changed spans
(5,29)-(5,69)
(5,36)-(5,47)
*)

(* type error slice
(2,22)-(2,71)
(2,22)-(2,71)
(2,22)-(2,71)
(2,22)-(2,71)
(2,43)-(2,44)
(2,55)-(2,71)
(2,61)-(2,67)
(2,61)-(2,71)
(2,68)-(2,69)
(2,70)-(2,71)
(4,4)-(5,72)
(4,21)-(5,69)
(5,3)-(5,69)
(5,3)-(5,69)
(5,18)-(5,21)
(5,29)-(5,35)
(5,29)-(5,55)
(5,29)-(5,69)
(5,36)-(5,47)
(5,49)-(5,55)
*)
