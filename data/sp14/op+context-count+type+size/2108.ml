
let rec digitsOfInt n = if n > 0 then (digitsOfInt n) / 10 else [];;


(* fix

let rec digitsOfInt n = if n > 0 then [2] else [1];;

*)

(* changed spans
(2,38)-(2,53)
(2,38)-(2,58)
(2,39)-(2,50)
(2,51)-(2,52)
(2,56)-(2,58)
(2,64)-(2,66)
*)

(* type error slice
(2,24)-(2,66)
(2,24)-(2,66)
(2,38)-(2,58)
(2,64)-(2,66)
*)
