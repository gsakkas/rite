
let rec digitsOfInt n = if n > 0 then (n mod 10) :: (digitsOfInt (n / 10));;


(* fix

let rec digitsOfInt n =
  if n > 0 then (n mod 10) :: (digitsOfInt (n / 10)) else [];;

*)

(* changed spans
(2,24)-(2,74)
[]
ListG EmptyG Nothing

*)
