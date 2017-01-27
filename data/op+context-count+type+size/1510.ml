
let rec digitsOfInt n =
  if n < 0
  then []
  else if n < 10 then n else [digitsOfInt (n / 10); n mod 10];;


(* fix

let rec digitsOfInt n =
  if n < 0
  then []
  else if n < 10 then [n] else (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(5,23)-(5,24)
(5,30)-(5,62)
(5,31)-(5,50)
(5,53)-(5,54)
(5,53)-(5,61)
(5,59)-(5,61)
*)

(* type error slice
(2,4)-(5,64)
(2,21)-(5,62)
(3,3)-(5,62)
(3,6)-(3,7)
(3,6)-(3,11)
(3,10)-(3,11)
(4,8)-(4,10)
(5,8)-(5,62)
(5,23)-(5,24)
(5,30)-(5,62)
(5,31)-(5,42)
(5,31)-(5,50)
(5,44)-(5,50)
*)
