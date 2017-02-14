
let rec digitsOfInt n =
  if n < 0
  then []
  else if (n mod 10) = 0 then n else (n mod 10) :: (digitsOfInt (n / 10));;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(3,5)-(3,10)
(5,7)-(5,73)
(5,10)-(5,20)
(5,10)-(5,24)
(5,11)-(5,12)
(5,17)-(5,19)
(5,23)-(5,24)
(5,30)-(5,31)
*)

(* type error slice
(3,2)-(5,73)
(3,2)-(5,73)
(3,5)-(3,6)
(3,5)-(3,10)
(3,5)-(3,10)
(3,9)-(3,10)
(4,7)-(4,9)
(5,7)-(5,73)
(5,7)-(5,73)
(5,30)-(5,31)
(5,37)-(5,73)
*)
