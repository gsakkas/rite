
let rec digitsOfInt n =
  if n <= 0
  then []
  else (match n with | n' -> [digitsOfInt (n / 10); n' mod 10]);;


(* fix

let modulus ss = ss mod 10;;

let rec digitsOfInt n =
  if n <= 0
  then []
  else (match n with | n' -> (digitsOfInt (n / 10)) @ [modulus n']);;

*)

(* changed spans
(2,21)-(5,63)
(5,30)-(5,63)
(5,31)-(5,50)
(5,53)-(5,55)
(5,53)-(5,62)
(5,60)-(5,62)
*)

(* type error slice
(2,4)-(5,66)
(2,21)-(5,63)
(3,3)-(5,63)
(5,9)-(5,63)
(5,30)-(5,63)
(5,30)-(5,63)
(5,31)-(5,42)
(5,31)-(5,50)
*)
