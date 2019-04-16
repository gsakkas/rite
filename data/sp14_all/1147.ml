
let rec digitsOfInt n =
  if n < 0
  then []
  else if (n / 10) > 0 then (digitsOfInt (n / 10)) @ [n mod 10];;


(* fix

let rec digitsOfInt n =
  if n < 0
  then []
  else if n < 10 then [n] else (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(5,11)-(5,23)
n < 10
BopG VarG LitG

(5,29)-(5,64)
[n]
ListG (fromList [VarG])

(5,64)-(5,64)
digitsOfInt (n / 10) @ [n mod 10]
AppG (fromList [AppG (fromList [EmptyG]),ListG (fromList [EmptyG])])

*)

(* type error slice
(5,8)-(5,64)
(5,29)-(5,64)
(5,52)-(5,53)
(5,64)-(5,64)
*)
