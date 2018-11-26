
let rec digitsOfInt n = if n <= 0 then [] else [digitsOfInt (n / 10)];;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(2,47)-(2,69)
(n mod 10) :: (digitsOfInt (n / 10))
ConAppG (Just (TupleG (fromList [AppG (fromList [BopG VarG LitG]),BopG VarG LitG]))) Nothing

(2,48)-(2,68)
n
VarG

(2,48)-(2,68)
n mod 10
BopG VarG LitG

(2,48)-(2,68)
10
LitG

*)
