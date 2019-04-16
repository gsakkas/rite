
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
(5,30)-(5,63)
digitsOfInt (n / 10) @ [modulus n']
AppG (fromList [AppG (fromList [EmptyG]),ListG (fromList [EmptyG])])

*)

(* type error slice
(2,4)-(5,66)
(2,21)-(5,64)
(3,3)-(5,64)
(5,8)-(5,64)
(5,30)-(5,63)
(5,31)-(5,42)
(5,31)-(5,51)
*)
