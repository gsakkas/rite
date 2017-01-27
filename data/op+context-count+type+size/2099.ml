
let rec digitsOfInt n = if n > 0 then [5] @ ((digitsOfInt n) / 10) else [1];;


(* fix

let rec digitsOfInt n = if n > 0 then [5] @ (digitsOfInt (n / 10)) else [1];;

*)

(* changed spans
(2,47)-(2,66)
(2,59)-(2,60)
*)

(* type error slice
(2,4)-(2,78)
(2,21)-(2,76)
(2,25)-(2,76)
(2,28)-(2,29)
(2,28)-(2,33)
(2,32)-(2,33)
(2,39)-(2,42)
(2,39)-(2,66)
(2,40)-(2,41)
(2,43)-(2,44)
(2,47)-(2,58)
(2,47)-(2,60)
(2,47)-(2,66)
(2,59)-(2,60)
*)
