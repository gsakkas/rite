
let rec digitsOfInt n = match n with | n -> 5 | 0 -> [];;


(* fix

let rec digitsOfInt n = match n with | n -> [n];;

*)

(* changed spans
(2,25)-(2,56)
(2,45)-(2,46)
(2,54)-(2,56)
*)

(* type error slice
(2,25)-(2,56)
(2,45)-(2,46)
(2,54)-(2,56)
*)
