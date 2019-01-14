
let rec digitsOfInt n = if n > 0 then (digitsOfInt (n mod 10)) @ [];;


(* fix

let rec digitsOfInt n = if n > 0 then (digitsOfInt (n mod 10)) @ [] else [];;

*)

(* changed spans
(2,24)-(2,67)
[]
ListG EmptyG Nothing

*)
