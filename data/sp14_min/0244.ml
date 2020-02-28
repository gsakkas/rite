
let rec digitsOfInt n = if n < 0 then [];;


(* fix

let rec digitsOfInt n = if n < 0 then [] else [];;

*)

(* changed spans
(2,41)-(2,41)
[]
ListG []

*)

(* type error slice
(2,25)-(2,41)
(2,39)-(2,41)
(2,41)-(2,41)
*)
