
let rec digitsOfInt n =
  if n < 0
  then []
  else if n < 10 then n else [digitsOfInt (n / 10); n mod 10];;


(* fix

let rec digitsOfInt n =
  if n < 0
  then []
  else if n < 10 then [n] else (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(5,22)-(5,23)
[n]
ListG VarG Nothing

(5,29)-(5,61)
(n mod 10) :: (digitsOfInt (n / 10))
ConAppG (Just (TupleG [BopG VarG LitG,AppG [BopG VarG LitG]])) Nothing

(5,30)-(5,50)
n
VarG

(5,30)-(5,50)
n mod 10
BopG VarG LitG

(5,30)-(5,50)
10
LitG

*)
