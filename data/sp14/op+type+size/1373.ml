
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
(5,22)-(5,23)
(5,29)-(5,61)
(5,30)-(5,50)
(5,52)-(5,53)
(5,52)-(5,60)
(5,58)-(5,60)
*)

(* type error slice
(3,2)-(5,61)
(3,2)-(5,61)
(3,5)-(3,6)
(3,5)-(3,10)
(3,5)-(3,10)
(3,9)-(3,10)
(4,7)-(4,9)
(5,7)-(5,61)
(5,7)-(5,61)
(5,22)-(5,23)
(5,29)-(5,61)
*)

(* all spans
(2,20)-(5,61)
(3,2)-(5,61)
(3,5)-(3,10)
(3,5)-(3,6)
(3,9)-(3,10)
(4,7)-(4,9)
(5,7)-(5,61)
(5,10)-(5,16)
(5,10)-(5,11)
(5,14)-(5,16)
(5,22)-(5,23)
(5,29)-(5,61)
(5,30)-(5,50)
(5,30)-(5,41)
(5,42)-(5,50)
(5,43)-(5,44)
(5,47)-(5,49)
(5,52)-(5,60)
(5,52)-(5,53)
(5,58)-(5,60)
*)
