
let rec digitsOfInt n = if n < 0 then true;;


(* fix

let rec digitsOfInt n = if n < 0 then [] else [];;

*)

(* changed spans
(2,39)-(2,43)
[]
ListG []

(2,43)-(2,43)
[]
ListG []

*)

(* type error slice
(2,25)-(2,43)
(2,39)-(2,43)
(2,43)-(2,43)
*)
