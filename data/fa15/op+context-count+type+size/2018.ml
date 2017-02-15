
let rec append l r = match l with | [] -> r | h::t -> h :: (append t r);;

let rec digitsOfInt n =
  if n <= 0 then [n] else ((append digitsOfInt (n / 10)), [n mod 10]);;


(* fix

let rec append l r = match l with | [] -> r | h::t -> h :: (append t r);;

let rec digitsOfInt n =
  if n <= 0 then [n] else append (digitsOfInt (n / 10)) [n mod 10];;

*)

(* changed spans
(5,26)-(5,69)
(5,35)-(5,46)
*)

(* type error slice
(2,21)-(2,71)
(2,21)-(2,71)
(2,21)-(2,71)
(2,21)-(2,71)
(2,42)-(2,43)
(2,54)-(2,71)
(2,59)-(2,71)
(2,60)-(2,66)
(2,67)-(2,68)
(2,69)-(2,70)
(4,3)-(5,71)
(4,20)-(5,69)
(5,2)-(5,69)
(5,2)-(5,69)
(5,17)-(5,20)
(5,26)-(5,69)
(5,27)-(5,56)
(5,28)-(5,34)
(5,35)-(5,46)
(5,47)-(5,55)
*)
