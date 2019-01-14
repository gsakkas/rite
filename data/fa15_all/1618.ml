
let rec digitsOfInt n =
  let m = n in if n < 0 then [] else [(digitsOfInt m) / 10; n mod 10];;


(* fix

let rec digitsOfInt n =
  if n < 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(3,38)-(3,53)
(@)
VarG

(3,38)-(3,58)
digitsOfInt (n / 10) @ [n mod 10]
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG Nothing])

(3,51)-(3,52)
n / 10
BopG VarG LitG

(3,56)-(3,58)
n
VarG

(3,60)-(3,68)
[n mod 10]
ListG (BopG EmptyG EmptyG) Nothing

*)
