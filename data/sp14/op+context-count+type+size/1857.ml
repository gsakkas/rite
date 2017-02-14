
let rec digitsOfInt n = (n mod 10) :: (if n > 0 then digitsOfInt (n / 10));;


(* fix

let rec digitsOfInt n =
  let int list digInt = n mod 10 in
  if n > 0 then digitsOfInt (n / 10) else [];;

*)

(* changed spans
(2,24)-(2,34)
(2,24)-(2,74)
(2,39)-(2,73)
*)

(* type error slice
(2,24)-(2,74)
(2,38)-(2,74)
(2,39)-(2,73)
*)
