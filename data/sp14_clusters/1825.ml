
let rec digitsOfInt n =
  if n <= 0 then [] else [digitsOfInt (n / 10); n mod 10];;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(3,25)-(3,57)
(n mod 10) :: (digitsOfInt (n / 10))
ConAppG (Just (TupleG [BopG VarG LitG,AppG [BopG VarG LitG]])) Nothing

(3,26)-(3,46)
n
VarG

(3,26)-(3,46)
n mod 10
BopG VarG LitG

(3,26)-(3,46)
10
LitG

*)
