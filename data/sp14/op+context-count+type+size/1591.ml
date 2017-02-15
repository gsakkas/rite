
let rec digitsOfInt n = if n <= 0 then [] else 1;;


(* fix

let rec digitsOfInt n = if n <= 0 then [] else [1];;

*)

(* changed spans
(2,47)-(2,48)
*)

(* type error slice
(2,24)-(2,48)
(2,24)-(2,48)
(2,39)-(2,41)
(2,47)-(2,48)
*)
