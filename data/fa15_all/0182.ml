
let rec digitsOfInt n = if n > 0 then (digitsOfInt (n / 10)) @ [];;


(* fix

let rec digitsOfInt n = if n > 0 then (digitsOfInt (n / 10)) @ [] else [];;

*)

(* changed spans
(2,24)-(2,65)
[]
ListG EmptyG Nothing

*)
