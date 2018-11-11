
let rec digitsOfInt n =
  if n <= 0
  then []
  else (let digit = digitsOfInt (n / 10) in [digit; n mod 10]);;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(5,7)-(5,62)
(n mod 10) :: (digitsOfInt (n / 10))
ConAppG (Just (TupleG [BopG VarG LitG,AppG [BopG VarG LitG]])) Nothing

(5,20)-(5,40)
n
VarG

(5,20)-(5,40)
n mod 10
BopG VarG LitG

(5,20)-(5,40)
10
LitG

*)
