
let rec digitsOfInt n = if n > 0 then (digitsOfInt n) / 10 else [1];;


(* fix

let rec digitsOfInt n = if n > 0 then [2] else [1];;

*)

(* changed spans
(2,39)-(2,59)
[2]
ListG (fromList [LitG])

*)

(* type error slice
(2,25)-(2,68)
(2,39)-(2,59)
(2,65)-(2,68)
*)
