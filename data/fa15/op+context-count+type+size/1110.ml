
let rec digitsOfInt n = if n < 0 then [1];;


(* fix

let rec digitsOfInt n = if n < 0 then [] else [1; 2];;

*)

(* changed spans
(2,24)-(2,41)
(2,38)-(2,41)
(2,39)-(2,40)
*)

(* type error slice
(2,24)-(2,41)
(2,24)-(2,41)
(2,24)-(2,41)
(2,38)-(2,41)
*)
