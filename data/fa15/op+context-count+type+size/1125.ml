
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
(2,20)-(5,63)
(5,29)-(5,62)
(5,30)-(5,50)
(5,52)-(5,54)
(5,52)-(5,61)
(5,59)-(5,61)
*)

(* type error slice
(2,3)-(5,65)
(2,20)-(5,63)
(3,2)-(5,63)
(5,7)-(5,63)
(5,29)-(5,62)
(5,29)-(5,62)
(5,30)-(5,41)
(5,30)-(5,50)
*)
