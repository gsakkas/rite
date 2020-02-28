
let rec digitsOfInt n = if n > 0 then [n; n mod 10];;


(* fix

let rec digitsOfInt n =
  if n > 0 then (n mod 10) :: (digitsOfInt (n / 10)) else [];;

*)

(* changed spans
(2,39)-(2,52)
(n mod 10) :: (digitsOfInt (n / 10))
AppG [BopG EmptyG EmptyG,AppG [EmptyG]]

(2,52)-(2,52)
[]
ListG []

*)

(* type error slice
(2,25)-(2,52)
(2,39)-(2,52)
(2,52)-(2,52)
*)
