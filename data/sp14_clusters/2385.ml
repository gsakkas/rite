
let rec digitsOfInt n =
  if n > 0 then digitsOfInt ((n mod 10) :: (n / 10)) else [];;


(* fix

let rec digitsOfInt n =
  if n > 0 then (n mod 10) :: (digitsOfInt (n / 10)) else [];;

*)

(* changed spans
(3,43)-(3,51)
digitsOfInt
VarG

(3,43)-(3,51)
digitsOfInt (n / 10)
AppG [BopG EmptyG EmptyG]

*)
