
let rec digitsOfInt n = let x = n mod 10 in ((digitsOfInt n) / 10) @ [x];;


(* fix

let rec digitsOfInt n =
  if n > 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(2,32)-(2,33)
n > 0
BopG VarG LitG

(2,32)-(2,40)
if n > 0
then []
else digitsOfInt (n / 10) @ [n mod 10]
IteG (BopG EmptyG EmptyG) (ListG EmptyG Nothing) (AppG (fromList [EmptyG]))

(2,38)-(2,40)
0
LitG

(2,44)-(2,72)
[]
ListG EmptyG Nothing

(2,58)-(2,59)
n / 10
BopG VarG LitG

(2,70)-(2,71)
n mod 10
BopG VarG LitG

*)
