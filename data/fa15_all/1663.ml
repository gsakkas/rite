
let rec digitsOfInt n = if n < 0 then [] else (match n with | f::b -> f);;


(* fix

let rec digitsOfInt n = if n < 0 then [] else (n mod 10) :: (digitsOfInt n);;

*)

(* changed spans
(2,46)-(2,72)
(n mod 10) :: (digitsOfInt n)
ConAppG (Just (TupleG (fromList [AppG (fromList [VarG]),BopG VarG LitG]))) Nothing

(2,53)-(2,54)
n mod 10
BopG VarG LitG

(2,70)-(2,71)
10
LitG

*)
