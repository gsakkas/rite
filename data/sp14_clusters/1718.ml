
let rec digitsOfInt n =
  if n <= 0 then [] else [n mod 10; (digitsOfInt n) / 10];;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else [n mod 10] @ (digitsOfInt (n / 10));;

*)

(* changed spans
(3,25)-(3,57)
[n mod 10] @ digitsOfInt (n / 10)
AppG [ListG EmptyG Nothing,AppG [EmptyG]]

(3,26)-(3,34)
(@)
VarG

(3,26)-(3,34)
[n mod 10]
ListG (BopG EmptyG EmptyG) Nothing

(3,49)-(3,50)
n / 10
BopG VarG LitG

*)
