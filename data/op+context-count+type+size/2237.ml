
let rec digitsOfInt n =
  if n > 0 then ((digitsOfInt n) mod 10) :: (n / 10) else [];;


(* fix

let rec digitsOfInt n =
  if n > 0 then (n mod 10) :: (digitsOfInt (n / 10)) else [];;

*)

(* changed spans
(3,19)-(3,30)
(3,19)-(3,32)
(3,46)-(3,52)
*)

(* type error slice
(2,4)-(3,63)
(2,21)-(3,61)
(3,3)-(3,61)
(3,19)-(3,30)
(3,19)-(3,32)
(3,19)-(3,40)
(3,19)-(3,52)
(3,19)-(3,52)
(3,46)-(3,52)
*)
