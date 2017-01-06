
let rec digitsOfInt n =
  if n > 0 then [digitsOfInt (n / 10); n mod 10] else [];;



let rec digitsOfInt n =
  if n > 0 then (digitsOfInt (n / 10)) @ [n mod 10] else [];;


(* changed spans
(3,17)-(3,18)
(3,38)-(3,39)
*)

(* type error slice
(3,18)-(3,37)
*)
