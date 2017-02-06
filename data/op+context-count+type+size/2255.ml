
let rec digitsOfInt n =
  if n > 0 then (digitsOfInt (n mod 10)) :: (n / 10) else [];;


(* fix

let rec digitsOfInt n =
  if n > 0 then (n mod 10) :: (digitsOfInt (n / 10)) else [];;

*)

(* changed spans
(3,18)-(3,29)
(3,18)-(3,39)
(3,46)-(3,52)
*)

(* type error slice
(2,4)-(3,63)
(2,21)-(3,61)
(3,3)-(3,61)
(3,3)-(3,61)
(3,6)-(3,7)
(3,6)-(3,11)
(3,18)-(3,29)
(3,18)-(3,39)
(3,18)-(3,52)
(3,46)-(3,52)
(3,59)-(3,61)
*)
