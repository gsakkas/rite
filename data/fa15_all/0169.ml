
let rec digitsOfInt n = [digitsOfInt n; n mod 10];;


(* fix

let rec digitsOfInt n = if n > 0 then [n mod 10] else [];;

*)

(* changed spans
(2,25)-(2,36)
if n > 0
then [n mod 10]
else []
IteG (BopG EmptyG EmptyG) (ListG EmptyG Nothing) (ListG EmptyG Nothing)

(2,37)-(2,38)
n > 0
BopG VarG LitG

(2,40)-(2,48)
0
LitG

(2,40)-(2,48)
[n mod 10]
ListG (BopG EmptyG EmptyG) Nothing

*)
