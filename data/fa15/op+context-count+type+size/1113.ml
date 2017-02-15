
let rec digitsOfInt n = if n < 0 then 0;;


(* fix

let rec digitsOfInt n = if n < 0 then [] else [1; 2];;

*)

(* changed spans
(2,24)-(2,39)
(2,38)-(2,39)
*)

(* type error slice
(2,24)-(2,39)
(2,24)-(2,39)
(2,24)-(2,39)
(2,38)-(2,39)
*)
