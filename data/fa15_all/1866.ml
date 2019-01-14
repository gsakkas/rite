
let rec digitsOfInt n = if n >= 0 then (n mod 10) :: (digitsOfInt (n / 10));;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(2,27)-(2,33)
n <= 0
BopG VarG LitG

(2,39)-(2,75)
[]
ListG EmptyG Nothing

*)
