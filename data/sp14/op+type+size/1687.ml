
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

(* all spans
(2,20)-(2,74)
(2,24)-(2,74)
(2,24)-(2,34)
(2,25)-(2,26)
(2,31)-(2,33)
(2,38)-(2,74)
(2,42)-(2,47)
(2,42)-(2,43)
(2,46)-(2,47)
(2,53)-(2,73)
(2,53)-(2,64)
(2,65)-(2,73)
(2,66)-(2,67)
(2,70)-(2,72)
(2,39)-(2,73)
*)
