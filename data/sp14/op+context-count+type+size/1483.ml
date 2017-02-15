
let rec digitsOfInt n = if n <= 0 then [] else n mod 10;;


(* fix

let rec digitsOfInt n = if n <= 0 then [] else [n];;

*)

(* changed spans
(2,47)-(2,55)
(2,53)-(2,55)
*)

(* type error slice
(2,24)-(2,55)
(2,24)-(2,55)
(2,39)-(2,41)
(2,47)-(2,55)
*)
