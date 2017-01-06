
let rec digitsOfInt n =
  if n > 0 then ((digitsOfInt n) / 10) :: (n mod 10) else [];;



let rec digitsOfInt n = if n > 0 then [n / 10; n mod 10] else [];;


(* changed spans
(3,17)-(3,30)
(3,32)-(3,33)
(3,38)-(3,44)
(3,52)-(3,53)
*)

(* type error slice
(3,19)-(3,52)
*)
