
let rec digitsOfInt n =
  if n < 0
  then []
  else if n < 10 then n else (digitsOfInt (n / 10)) @ [n mod 10];;


(* fix

let rec digitsOfInt n =
  if n < 0
  then []
  else if n < 10 then [n] else (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(5,23)-(5,24)
[n]
ListG (fromList [VarG])

*)

(* type error slice
(3,6)-(3,7)
(3,6)-(3,11)
(3,10)-(3,11)
(5,8)-(5,65)
(5,23)-(5,24)
(5,30)-(5,65)
(5,53)-(5,54)
*)
