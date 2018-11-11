
let rec digitsOfInt n = (n mod 10) @ [(digitsOfInt n) / 10];;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else [n mod 10] @ (digitsOfInt (n / 10));;

*)

(* changed spans
(2,24)-(2,34)
[n mod 10]
ListG (BopG EmptyG EmptyG) Nothing

(2,24)-(2,59)
n
VarG

(2,24)-(2,59)
n <= 0
BopG VarG LitG

(2,24)-(2,59)
0
LitG

(2,24)-(2,59)
if n <= 0
then []
else [n mod 10] @ digitsOfInt (n / 10)
IteG (BopG EmptyG EmptyG) (ListG EmptyG Nothing) (AppG [EmptyG,EmptyG])

(2,24)-(2,59)
[]
ListG EmptyG Nothing

(2,51)-(2,52)
n / 10
BopG VarG LitG

*)
