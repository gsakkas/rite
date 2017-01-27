
let rec digitsOfInt n =
  if n <= 0
  then []
  else (let digit = digitsOfInt (n / 10) in [digit; n mod 10]);;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(5,9)-(5,62)
(5,21)-(5,40)
(5,45)-(5,62)
(5,46)-(5,51)
(5,53)-(5,54)
(5,53)-(5,61)
(5,59)-(5,61)
*)

(* type error slice
(2,4)-(5,65)
(2,21)-(5,62)
(3,3)-(5,62)
(3,6)-(3,7)
(3,6)-(3,12)
(3,11)-(3,12)
(4,8)-(4,10)
(5,21)-(5,32)
(5,21)-(5,40)
(5,34)-(5,40)
*)
