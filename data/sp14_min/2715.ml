
let rec digitsOfInt n =
  if n > 0 then (digitsOfInt (n / 10)) @ (n mod 10) else [];;


(* fix

let rec digitsOfInt n =
  if n > 0 then (digitsOfInt (n / 10)) @ [n mod 10] else [];;

*)

(* changed spans
(3,42)-(3,52)
[n mod 10]
ListG [BopG EmptyG EmptyG]

*)

(* type error slice
(3,17)-(3,52)
(3,40)-(3,41)
(3,42)-(3,52)
*)
