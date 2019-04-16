
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
(5,30)-(5,52)
n_ mod 10
BopG VarG LitG

(5,56)-(5,67)
digitsOfInt (n / 10)
AppG (fromList [BopG EmptyG EmptyG])

*)

(* type error slice
(2,4)-(5,70)
(2,21)-(5,68)
(3,3)-(5,68)
(5,8)-(5,68)
(5,30)-(5,52)
(5,30)-(5,67)
(5,31)-(5,42)
(5,56)-(5,67)
*)
