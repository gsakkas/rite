
let rec digitsOfInt n = if n > 0 then (digitsOfInt n) :: (n mod 10);;


(* fix

let rec digitsOfInt n =
  if n > 0 then (n mod 10) :: (digitsOfInt (n / 10)) else [];;

*)

(* changed spans
(2,24)-(2,67)
[]
ListG EmptyG Nothing

(2,38)-(2,53)
n
VarG

(2,38)-(2,53)
n mod 10
BopG VarG LitG

(2,38)-(2,53)
10
LitG

(2,57)-(2,67)
n / 10
BopG VarG LitG

*)
