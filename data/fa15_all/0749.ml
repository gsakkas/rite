
let rec digitsOfInt n = ((digitsOfInt n) / 10) @ [n mod 10];;


(* fix

let rec digitsOfInt n =
  if n > 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(2,24)-(2,59)
n
VarG

(2,24)-(2,59)
n > 0
BopG VarG LitG

(2,24)-(2,59)
0
LitG

(2,24)-(2,59)
if n > 0
then []
else digitsOfInt (n / 10) @ [n mod 10]
IteG (BopG EmptyG EmptyG) (ListG EmptyG Nothing) (AppG (fromList [EmptyG]))

(2,24)-(2,59)
[]
ListG EmptyG Nothing

(2,38)-(2,39)
n / 10
BopG VarG LitG

*)
