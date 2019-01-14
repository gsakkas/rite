
let rec digitsOfInt n = if n <= 0 then [] else (digitsOfInt (n / 10)) :: n;;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(2,47)-(2,69)
(@)
VarG

(2,47)-(2,74)
digitsOfInt (n / 10) @ [n mod 10]
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG Nothing])

(2,73)-(2,74)
n mod 10
BopG VarG LitG

(2,73)-(2,74)
[n mod 10]
ListG (BopG EmptyG EmptyG) Nothing

*)
