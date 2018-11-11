
let rec digitsOfInt n =
  if n > 10 then [digitsOfInt (n / 10); n mod 10] else n;;


(* fix

let rec digitsOfInt n = if n >= 100 then [n mod 10] else [n];;

*)

(* changed spans
(3,30)-(3,38)
n >= 100
BopG VarG LitG

(3,35)-(3,37)
100
LitG

(3,40)-(3,48)
[n mod 10]
ListG (BopG EmptyG EmptyG) Nothing

(3,55)-(3,56)
[n]
ListG VarG Nothing

*)
