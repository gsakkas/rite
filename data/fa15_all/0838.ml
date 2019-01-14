
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
ss
VarG

(2,20)-(5,63)
fun ss -> ss mod 10
LamG (BopG EmptyG EmptyG)

(2,20)-(5,63)
ss mod 10
BopG VarG LitG

(2,20)-(5,63)
10
LitG

(5,29)-(5,62)
digitsOfInt (n / 10) @ [modulus n']
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG Nothing])

(5,30)-(5,50)
(@)
VarG

(5,52)-(5,54)
modulus
VarG

(5,52)-(5,54)
modulus n'
AppG (fromList [VarG])

(5,52)-(5,61)
[modulus n']
ListG (AppG (fromList [EmptyG])) Nothing

*)
