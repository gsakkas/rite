
let rec digitsOfInt n = [(digitsOfInt n) / 10] @ [n mod 10];;


(* fix

let rec digitsOfInt n = (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(2,26)-(2,37)
(n mod 10) :: (digitsOfInt (n / 10))
ConAppG (Just (TupleG [BopG VarG LitG,AppG [BopG VarG LitG]])) Nothing

(2,38)-(2,39)
n mod 10
BopG VarG LitG

(2,50)-(2,51)
digitsOfInt
VarG

(2,50)-(2,51)
n / 10
BopG VarG LitG

(2,50)-(2,58)
digitsOfInt (n / 10)
AppG [BopG EmptyG EmptyG]

*)
