
let rec digitsOfInt n = if n > 0 then (n mod 10) :: (digitsOfInt (n / 10));;


(* fix

let rec digitsOfInt n =
  if n > 0 then (n mod 10) :: (digitsOfInt (n / 10)) else [];;

*)

(* changed spans
(2,24)-(2,74)
*)

(* type error slice
(2,24)-(2,74)
(2,38)-(2,74)
*)

(* all spans
(2,20)-(2,74)
(2,24)-(2,74)
(2,27)-(2,32)
(2,27)-(2,28)
(2,31)-(2,32)
(2,38)-(2,74)
(2,38)-(2,48)
(2,39)-(2,40)
(2,45)-(2,47)
(2,52)-(2,74)
(2,53)-(2,64)
(2,65)-(2,73)
(2,66)-(2,67)
(2,70)-(2,72)
*)
