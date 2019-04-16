
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
(5,30)-(5,67)
digitsOfInt (n / 10) @ [modulus n']
AppG (fromList [AppG (fromList [EmptyG]),ListG (fromList [EmptyG])])

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
