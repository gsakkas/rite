
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
(2,20)-(5,67)
(5,29)-(5,51)
(5,29)-(5,66)
(5,55)-(5,66)
(5,56)-(5,58)
(5,63)-(5,65)
*)

(* type error slice
(2,3)-(5,69)
(2,20)-(5,67)
(3,2)-(5,67)
(5,7)-(5,67)
(5,29)-(5,51)
(5,29)-(5,66)
(5,30)-(5,41)
(5,55)-(5,66)
*)

(* all spans
(2,20)-(5,67)
(3,2)-(5,67)
(3,5)-(3,11)
(3,5)-(3,6)
(3,10)-(3,11)
(4,7)-(4,9)
(5,7)-(5,67)
(5,14)-(5,15)
(5,29)-(5,66)
(5,29)-(5,51)
(5,30)-(5,41)
(5,42)-(5,50)
(5,43)-(5,44)
(5,47)-(5,49)
(5,55)-(5,66)
(5,56)-(5,58)
(5,63)-(5,65)
*)
