
let rec digitsOfInt n = if n > 0 then [digitsOfInt (n mod 10)] else [];;


(* fix

let rec digitsOfInt n = if n > 0 then [n mod 100; n mod 10] else [];;

*)

(* changed spans
(2,39)-(2,50)
[n mod 100 ; n mod 10]
ListG (BopG EmptyG EmptyG) Nothing

(2,58)-(2,60)
n
VarG

(2,58)-(2,60)
n mod 10
BopG VarG LitG

(2,58)-(2,60)
100
LitG

*)
