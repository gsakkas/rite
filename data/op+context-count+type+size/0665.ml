
let rec digitsOfInt n =
  if n > 0 then (digitsOfInt (n / 10)) :: (n mod 10) else [];;



let rec digitsOfInt n =
  if n > 0 then (digitsOfInt (n / 10)) @ [n mod 10] else [];;


(* changed spans
(3,40)-(3,44)
(3,52)-(3,53)
*)

(* type error slice
(3,18)-(3,52)
*)
