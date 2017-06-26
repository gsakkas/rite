
let rec digitsOfInt n = if n < 0 then 7;;


(* fix

let rec digitsOfInt n = if n < 0 then [7] else [8];;

*)

(* changed spans
(2,24)-(2,39)
(2,38)-(2,39)
*)

(* type error slice
(2,24)-(2,39)
(2,38)-(2,39)
*)

(* all spans
(2,20)-(2,39)
(2,24)-(2,39)
(2,27)-(2,32)
(2,27)-(2,28)
(2,31)-(2,32)
(2,38)-(2,39)
*)
