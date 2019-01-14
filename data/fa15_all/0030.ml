
let rec digitsOfInt n =
  match n < 0 with | true  -> [] | false  -> [[(digitsOfInt n) / 10]];;


(* fix

let rec digitsOfInt n =
  match n < 0 with
  | true  -> []
  | false  -> (n mod 10) :: (digitsOfInt (n / 10));;

let _ = digitsOfInt 3124;;

*)

(* changed spans
(3,47)-(3,62)
n
VarG

(3,47)-(3,62)
n mod 10
BopG VarG LitG

(3,47)-(3,62)
10
LitG

(3,47)-(3,67)
(n mod 10) :: (digitsOfInt (n / 10))
ConAppG (Just (TupleG (fromList [AppG (fromList [BopG VarG LitG]),BopG VarG LitG]))) Nothing

(3,60)-(3,61)
n / 10
BopG VarG LitG

*)
