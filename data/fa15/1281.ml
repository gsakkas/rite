
let rec digitsOfInt n = if n < 0 then [7];;


(* fix

let rec digitsOfInt n = if n < 0 then [7] else [8];;

*)

(* changed spans
(2,42)-(2,42)
[8]
ListG [LitG]

*)

(* type error slice
(2,25)-(2,42)
(2,39)-(2,42)
(2,42)-(2,42)
*)
