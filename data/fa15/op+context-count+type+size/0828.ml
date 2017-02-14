
let rec digitsOfInt n =
  if n < 0
  then []
  else if (n mod 10) = 0 then n else (n mod 10) :: (digitsOfInt (n / 10));;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(3,6)-(3,11)
(5,8)-(5,72)
(5,12)-(5,13)
(5,12)-(5,20)
(5,12)-(5,25)
(5,18)-(5,20)
(5,24)-(5,25)
(5,31)-(5,32)
*)

(* type error slice
(3,3)-(5,72)
(3,3)-(5,72)
(3,6)-(3,7)
(3,6)-(3,11)
(3,6)-(3,11)
(3,10)-(3,11)
(4,8)-(4,10)
(5,8)-(5,72)
(5,8)-(5,72)
(5,31)-(5,32)
(5,39)-(5,72)
*)
