
let rec digitsOfInt n = if n > 0 then (n mod 10) :: (digitsOfInt (n / 10));;


(* fix

let rec digitsOfInt n =
  if n > 0 then (n mod 10) :: (digitsOfInt (n / 10)) else [];;

*)

(* changed spans
(2,75)-(2,75)
[]
ListG (fromList [])

*)

(* type error slice
(2,25)-(2,75)
(2,39)-(2,75)
(2,75)-(2,75)
*)
