
let rec digitsOfInt n = if n < 0 then [7];;


(* fix

let rec digitsOfInt n = if n < 0 then [7] else [8];;

*)

(* changed spans
(2,24)-(2,41)
*)

(* type error slice
(2,24)-(2,41)
(2,24)-(2,41)
(2,24)-(2,41)
(2,38)-(2,41)
*)
