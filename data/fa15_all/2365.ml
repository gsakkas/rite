
let rec digitsOfInt n =
  if n <= 0 then [] else [n mod 10] :: ((digitsOfInt n) / 10);;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else [n mod 10] @ (digitsOfInt (n / 10));;

*)

(* changed spans
(3,25)-(3,35)
(@)
VarG

(3,25)-(3,61)
[n mod 10] @ digitsOfInt (n / 10)
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG Nothing])

(3,53)-(3,54)
n / 10
BopG VarG LitG

*)
