
let rec digitsOfInt n =
  if n <= 0
  then []
  else (let digit = digitsOfInt (n / 10) in [digit; n mod 10]);;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(5,7)-(5,62)
(5,20)-(5,40)
(5,44)-(5,61)
(5,45)-(5,50)
(5,52)-(5,53)
(5,52)-(5,60)
(5,58)-(5,60)
*)

(* type error slice
(2,3)-(5,64)
(2,20)-(5,62)
(3,2)-(5,62)
(5,7)-(5,62)
(5,7)-(5,62)
(5,20)-(5,31)
(5,20)-(5,40)
(5,44)-(5,61)
(5,44)-(5,61)
(5,45)-(5,50)
*)
