
let rec digitsOfInt n =
  if n < 0
  then []
  else (let a = n / 10 in let b = n mod 10 in (digitsOfInt a) :: b);;


(* fix

let rec digitsOfInt n =
  if n < 0
  then []
  else (let a = n / 10 in let b = n mod 10 in let c = [a; b] in c);;

*)

(* changed spans
(5,48)-(5,59)
(5,48)-(5,61)
(5,48)-(5,67)
(5,60)-(5,61)
*)

(* type error slice
(2,4)-(5,70)
(2,21)-(5,67)
(3,3)-(5,67)
(3,6)-(3,7)
(3,6)-(3,11)
(3,10)-(3,11)
(4,8)-(4,10)
(5,9)-(5,67)
(5,17)-(5,23)
(5,27)-(5,67)
(5,35)-(5,43)
(5,48)-(5,59)
(5,48)-(5,61)
(5,48)-(5,67)
(5,60)-(5,61)
(5,66)-(5,67)
*)
