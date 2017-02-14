
let rec digitsOfInt n = if n > 0 then [5] @ ((digitsOfInt n) / 10) else [1];;


(* fix

let rec digitsOfInt n = if n > 0 then [5] @ (digitsOfInt (n / 10)) else [1];;

*)

(* changed spans
(2,44)-(2,66)
(2,58)-(2,59)
*)

(* type error slice
(2,3)-(2,77)
(2,20)-(2,75)
(2,24)-(2,75)
(2,38)-(2,66)
(2,42)-(2,43)
(2,44)-(2,66)
(2,44)-(2,66)
(2,45)-(2,60)
(2,46)-(2,57)
(2,72)-(2,75)
*)
