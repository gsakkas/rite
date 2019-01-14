
let rec digitsOfInt n =
  if n < 0 then [] else ([] :: (digitsOfInt (n / 10))) @ (n mod 10);;


(* fix

let rec digitsOfInt n =
  if n < 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(3,57)-(3,67)
[n mod 10]
ListG (BopG EmptyG EmptyG) Nothing

*)
