
let rec digitsOfInt n = if n > 0 then (digitsOfInt (n / 10)) @ [];;


(* fix

let rec digitsOfInt n = if n > 0 then (digitsOfInt (n / 10)) @ [] else [];;

*)

(* changed spans
(2,66)-(2,66)
[]
ListG (fromList [])

*)

(* type error slice
(2,25)-(2,66)
(2,39)-(2,66)
(2,62)-(2,63)
(2,66)-(2,66)
*)
