
let rec digitsOfInt n =
  if n > 0 then (digitsOfInt (n / 10)) @ (n mod 10) else [];;


(* fix

let rec digitsOfInt n =
  if n > 0 then (digitsOfInt (n / 10)) @ [n mod 10] else [];;

*)

(* changed spans
(3,41)-(3,51)
[n mod 10]
ListG (BopG EmptyG EmptyG) Nothing

*)
