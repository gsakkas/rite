
let rec digitsOfInt n = if n > 10 then (n mod 10) :: (digitsOfInt (n / 10));;


(* fix

let rec digitsOfInt n =
  if n > 10 then (n mod 10) :: (digitsOfInt (n / 10)) else [n];;

*)

(* changed spans
(2,24)-(2,75)
[n]
ListG VarG Nothing

*)
