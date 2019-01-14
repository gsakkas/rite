
let rec digitsOfInt n = if n > 0 then [digitsOfInt (n / 10)];;


(* fix

let rec digitsOfInt n = if n < 0 then [] else digitsOfInt (n / 10);;

*)

(* changed spans
(2,27)-(2,32)
n < 0
BopG VarG LitG

(2,38)-(2,60)
[]
ListG EmptyG Nothing

*)
