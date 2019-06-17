
let rec digitsOfInt n = if n < 0 then [];;


(* fix

let rec digitsOfInt n = if n < 0 then [7] else [8];;

*)

(* changed spans
(2,39)-(2,41)
[7]
ListG [LitG]

(2,41)-(2,41)
[8]
ListG [LitG]

*)

(* type error slice
(2,25)-(2,41)
(2,39)-(2,41)
(2,41)-(2,41)
*)
