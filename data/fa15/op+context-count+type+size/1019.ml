
let rec digitsOfInt n =
  if n <= 0
  then []
  else (match n with | n_ -> (digitsOfInt (n / 10)) :: (n_ mod 10));;


(* fix

let rec digitsOfInt n =
  if n <= 0
  then []
  else (match n with | n_ -> (n_ mod 10) :: (digitsOfInt (n / 10)));;

*)

(* changed spans
(5,29)-(5,51)
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
(5,29)-(5,66)
(5,29)-(5,66)
(5,30)-(5,41)
(5,55)-(5,66)
*)
