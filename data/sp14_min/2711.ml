
let rec digitsOfInt n = if n > 0 then (digitsOfInt n) :: (n mod 10);;


(* fix

let rec digitsOfInt n =
  if n > 0 then (n mod 10) :: (digitsOfInt (n / 10)) else [];;

*)

(* changed spans
(2,39)-(2,54)
n mod 10
BopG VarG LitG

(2,58)-(2,68)
digitsOfInt (n / 10)
AppG [BopG EmptyG EmptyG]

(2,68)-(2,68)
[]
ListG []

*)

(* type error slice
(2,25)-(2,68)
(2,39)-(2,68)
(2,58)-(2,68)
(2,68)-(2,68)
*)
