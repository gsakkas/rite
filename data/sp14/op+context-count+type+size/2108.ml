
let rec digitsOfInt n = if n > 0 then (digitsOfInt n) / 10 else [];;


(* fix

let rec digitsOfInt n = if n > 0 then [2] else [1];;

*)

(* changed spans
(2,40)-(2,51)
(2,40)-(2,53)
(2,40)-(2,59)
(2,52)-(2,53)
(2,57)-(2,59)
(2,65)-(2,67)
*)

(* type error slice
(2,25)-(2,67)
(2,25)-(2,67)
(2,40)-(2,59)
(2,65)-(2,67)
*)
