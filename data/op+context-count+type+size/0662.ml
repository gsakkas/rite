
let rec digitsOfInt n =
  if n > 0 then [[(digitsOfInt n) / 10]; n mod 10] else [];;



let rec digitsOfInt n = if n > 0 then [n; n mod 10] else [];;


(* changed spans
(3,18)-(3,31)
(3,33)-(3,40)
*)

(* type error slice
(3,17)-(3,51)
*)
