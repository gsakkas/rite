
let rec digitsOfInt n = if n > 0 then (n / 10) :: (n mod 10) else [];;



let rec digitsOfInt n = if n > 0 then [n / 10; n mod 10] else [];;


(* changed spans
(2,39)-(2,40)
(2,46)-(2,52)
(2,60)-(2,61)
*)

(* type error slice
(2,40)-(2,60)
*)
