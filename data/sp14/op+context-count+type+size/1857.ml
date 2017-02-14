
let rec digitsOfInt n = (n mod 10) :: (if n > 0 then digitsOfInt (n / 10));;


(* fix

let rec digitsOfInt n =
  let int list digInt = n mod 10 in
  if n > 0 then digitsOfInt (n / 10) else [];;

*)

(* changed spans
(2,26)-(2,34)
(2,26)-(2,73)
(2,40)-(2,73)
*)

(* type error slice
(2,26)-(2,73)
(2,40)-(2,73)
(2,40)-(2,73)
*)
