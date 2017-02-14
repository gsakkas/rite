
let rec digitsOfInt n =
  if n <= 0
  then []
  else (match n with | n' -> (digitsOfInt (n / 10)) :: (n' mod 10));;


(* fix

let modulus ss = ss mod 10;;

let rec digitsOfInt n =
  if n <= 0
  then []
  else (match n with | n' -> (digitsOfInt (n / 10)) @ [modulus n']);;

*)

(* changed spans
(2,21)-(5,66)
(5,31)-(5,50)
(5,31)-(5,66)
(5,57)-(5,59)
(5,57)-(5,66)
(5,64)-(5,66)
*)

(* type error slice
(2,4)-(5,70)
(2,21)-(5,66)
(3,3)-(5,66)
(5,9)-(5,66)
(5,31)-(5,42)
(5,31)-(5,50)
(5,31)-(5,66)
(5,31)-(5,66)
(5,31)-(5,66)
(5,57)-(5,66)
*)
