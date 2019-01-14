
let rec digitsOfInt n =
  if n < 0 then [] else (match n with | h::t -> [h; digitsOfInt t]);;


(* fix

let rec digitsOfInt n = if n < 0 then [] else [] @ [n mod 10];;

*)

(* changed spans
(3,24)-(3,67)
[] @ [n mod 10]
AppG (fromList [ListG EmptyG Nothing])

(3,31)-(3,32)
(@)
VarG

(3,31)-(3,32)
n mod 10
BopG VarG LitG

(3,31)-(3,32)
[]
ListG EmptyG Nothing

(3,31)-(3,32)
[n mod 10]
ListG (BopG EmptyG EmptyG) Nothing

(3,64)-(3,65)
10
LitG

*)
