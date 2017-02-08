
let rec digitsOfInt n =
  if n > 0 then digitsOfInt ((n mod 10) :: (n / 10)) else [];;


(* fix

let rec digitsOfInt n =
  if n > 0 then (n mod 10) :: (digitsOfInt (n / 10)) else [];;

*)

(* changed spans
(3,17)-(3,28)
(3,17)-(3,51)
(3,45)-(3,51)
*)

(* type error slice
(2,4)-(3,63)
(2,21)-(3,61)
(3,6)-(3,7)
(3,6)-(3,11)
(3,6)-(3,11)
(3,10)-(3,11)
(3,17)-(3,28)
(3,17)-(3,51)
(3,31)-(3,51)
(3,31)-(3,51)
(3,45)-(3,51)
*)
