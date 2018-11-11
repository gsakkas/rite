
let rec digitsOfInt n =
  if n <= 0 then [] else [(digitsOfInt n) / 10; n mod 10];;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else [n mod 10] @ (digitsOfInt (n / 10));;

*)

(* changed spans
(3,27)-(3,38)
[n mod 10] @ digitsOfInt (n / 10)
AppG [ListG EmptyG Nothing,AppG [EmptyG]]

(3,39)-(3,40)
(@)
VarG

(3,39)-(3,40)
n mod 10
BopG VarG LitG

(3,39)-(3,40)
[n mod 10]
ListG (BopG EmptyG EmptyG) Nothing

(3,48)-(3,49)
digitsOfInt
VarG

(3,48)-(3,49)
n / 10
BopG VarG LitG

(3,48)-(3,56)
digitsOfInt (n / 10)
AppG [BopG EmptyG EmptyG]

*)
