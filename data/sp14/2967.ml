
let rec digitsOfInt n = if n > 10 then (n mod 10) :: (digitsOfInt (n / 10));;


(* fix

let rec digitsOfInt n =
  if n > 10 then (n mod 10) :: (digitsOfInt (n / 10)) else [n];;

*)

(* changed spans
(2,24)-(2,75)
*)

(* type error slice
(2,24)-(2,75)
(2,39)-(2,75)
*)

(* all spans
(2,20)-(2,75)
(2,24)-(2,75)
(2,27)-(2,33)
(2,27)-(2,28)
(2,31)-(2,33)
(2,39)-(2,75)
(2,39)-(2,49)
(2,40)-(2,41)
(2,46)-(2,48)
(2,53)-(2,75)
(2,54)-(2,65)
(2,66)-(2,74)
(2,67)-(2,68)
(2,71)-(2,73)
*)
