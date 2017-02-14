
let rec digitsOfInt n =
  if n > 0 then digitsOfInt ((n mod 10) :: (n / 10)) else [];;


(* fix

let rec digitsOfInt n =
  if n > 0 then (n mod 10) :: (digitsOfInt (n / 10)) else [];;

*)

(* changed spans
(3,16)-(3,27)
(3,16)-(3,52)
(3,43)-(3,51)
*)

(* type error slice
(2,3)-(3,62)
(2,20)-(3,60)
(3,5)-(3,6)
(3,5)-(3,10)
(3,5)-(3,10)
(3,9)-(3,10)
(3,16)-(3,27)
(3,16)-(3,52)
(3,28)-(3,52)
(3,28)-(3,52)
(3,43)-(3,51)
*)
