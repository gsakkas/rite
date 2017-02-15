
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
(5,46)-(5,61)
(5,46)-(5,66)
(5,47)-(5,58)
(5,59)-(5,60)
*)

(* type error slice
(2,3)-(5,69)
(2,20)-(5,67)
(3,2)-(5,67)
(5,7)-(5,67)
(5,26)-(5,66)
(5,26)-(5,66)
(5,34)-(5,42)
(5,46)-(5,61)
(5,46)-(5,66)
(5,46)-(5,66)
(5,46)-(5,66)
(5,47)-(5,58)
(5,65)-(5,66)
*)
