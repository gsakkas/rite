
let rec digitsOfInt n =
  if n > 0 then (digitsOfInt (n / 10)) :: (n mod 10) else 0;;


(* fix

let rec digitsOfInt n =
  if n > 0 then (n mod 10) :: (digitsOfInt (n / 10)) else [];;

*)

(* changed spans
(3,16)-(3,38)
(3,42)-(3,52)
(3,43)-(3,44)
(3,49)-(3,51)
(3,58)-(3,59)
*)

(* type error slice
(2,3)-(3,61)
(2,20)-(3,59)
(3,2)-(3,59)
(3,2)-(3,59)
(3,16)-(3,38)
(3,16)-(3,52)
(3,16)-(3,52)
(3,16)-(3,52)
(3,17)-(3,28)
(3,42)-(3,52)
(3,58)-(3,59)
*)
