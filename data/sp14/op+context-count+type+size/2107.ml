
let rec digitsOfInt n = if n > 0 then (digitsOfInt n) / 10 else [1];;


(* fix

let rec digitsOfInt n = if n > 0 then [2] else [1];;

*)

(* changed spans
(2,40)-(2,51)
(2,40)-(2,53)
(2,40)-(2,59)
(2,52)-(2,53)
(2,57)-(2,59)
*)

(* type error slice
(2,25)-(2,68)
(2,25)-(2,68)
(2,40)-(2,59)
(2,65)-(2,68)
*)
