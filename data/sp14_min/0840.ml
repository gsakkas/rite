
let rec digitsOfInt n =
  if n > 0 then (digitsOfInt (n / 10)) :: (n mod 10) else 0;;


(* fix

let rec digitsOfInt n =
  if n > 0 then (n mod 10) :: (digitsOfInt (n / 10)) else [];;

*)

(* changed spans
(3,17)-(3,39)
n mod 10
BopG VarG LitG

(3,43)-(3,53)
digitsOfInt (n / 10)
AppG [BopG EmptyG EmptyG]

(3,59)-(3,60)
[]
ListG []

*)

(* type error slice
(3,3)-(3,60)
(3,17)-(3,53)
(3,43)-(3,53)
(3,59)-(3,60)
*)
