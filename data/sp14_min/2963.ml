
let rec digitsOfInt n = if n > 0 then (digitsOfInt n) / 10 else [];;


(* fix

let rec digitsOfInt n = if n > 0 then [2] else [1];;

*)

(* changed spans
(2,39)-(2,59)
[2]
ListG [LitG]

(2,65)-(2,67)
[1]
ListG [LitG]

*)

(* type error slice
(2,25)-(2,67)
(2,39)-(2,59)
(2,65)-(2,67)
*)
