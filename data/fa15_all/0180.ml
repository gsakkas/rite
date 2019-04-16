
let rec digitsOfInt n = if n > 0 then (digitsOfInt (n mod 10)) @ [];;


(* fix

let rec digitsOfInt n = if n > 0 then (digitsOfInt (n mod 10)) @ [] else [];;

*)

(* changed spans
(2,68)-(2,68)
[]
ListG (fromList [])

*)

(* type error slice
(2,25)-(2,68)
(2,39)-(2,68)
(2,64)-(2,65)
(2,68)-(2,68)
*)
