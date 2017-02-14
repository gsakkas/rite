
let rec digitsOfInt n = match n with | n -> 5 | 0 -> [];;


(* fix

let rec digitsOfInt n = match n with | n -> [n];;

*)

(* changed spans
(2,24)-(2,55)
(2,44)-(2,45)
(2,53)-(2,55)
*)

(* type error slice
(2,24)-(2,55)
(2,24)-(2,55)
(2,44)-(2,45)
(2,53)-(2,55)
*)
