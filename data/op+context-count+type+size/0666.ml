
let rec digitsOfInt n =
  if n > 0 then (digitsOfInt (n / 10)) @ (n mod 10) else [];;



let rec digitsOfInt n =
  if n > 0 then (digitsOfInt (n / 10)) @ [n mod 10] else [];;


(* changed spans
(3,42)-(3,43)
(3,51)-(3,52)
*)

(* type error slice
(3,18)-(3,51)
*)
