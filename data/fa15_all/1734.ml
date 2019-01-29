
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
ConAppG (Just (TupleG (fromList [AppG (fromList [BopG VarG LitG]),BopG VarG LitG]))) Nothing

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
