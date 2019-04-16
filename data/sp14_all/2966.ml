
let rec digitsOfInt n = if n > 0 then [5] @ ((digitsOfInt n) / 10) else [1];;


(* fix

let rec digitsOfInt n = if n > 0 then [5] @ (digitsOfInt (n / 10)) else [1];;

*)

(* changed spans
(2,45)-(2,67)
digitsOfInt (n / 10)
AppG (fromList [BopG EmptyG EmptyG])

*)

(* type error slice
(2,4)-(2,78)
(2,21)-(2,76)
(2,25)-(2,76)
(2,39)-(2,67)
(2,43)-(2,44)
(2,45)-(2,67)
(2,46)-(2,61)
(2,47)-(2,58)
(2,73)-(2,76)
*)
