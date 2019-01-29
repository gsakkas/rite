
let rec digitsOfInt n = if n > 0 then (digitsOfInt n) / 10 else [];;


(* fix

let rec digitsOfInt n = if n > 0 then [5] @ (digitsOfInt (n / 10)) else [1];;

*)

(* changed spans
(2,38)-(2,53)
(@)
VarG

(2,38)-(2,53)
5
LitG

(2,38)-(2,53)
[5]
ListG LitG Nothing

(2,38)-(2,58)
[5] @ digitsOfInt (n / 10)
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG Nothing])

(2,51)-(2,52)
n / 10
BopG VarG LitG

(2,64)-(2,66)
[1]
ListG LitG Nothing

*)
