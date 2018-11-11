
let rec digitsOfInt n = if n > 10 then [n; n mod 10] else n;;


(* fix

let rec digitsOfInt n = if n >= 100 then [n mod 10] else [n];;

*)

(* changed spans
(2,39)-(2,52)
n >= 100
BopG VarG LitG

(2,43)-(2,51)
100
LitG

(2,43)-(2,51)
[n mod 10]
ListG (BopG EmptyG EmptyG) Nothing

(2,58)-(2,59)
[n]
ListG VarG Nothing

*)
