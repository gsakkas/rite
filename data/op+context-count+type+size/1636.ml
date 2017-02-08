
let rec digitsOfInt n =
  if n > 0 then (digitsOfInt (n / 10)) :: (n mod 10) else 0;;


(* fix

let rec digitsOfInt n =
  if n > 0 then (n mod 10) :: (digitsOfInt (n / 10)) else [];;

*)

(* changed spans
(3,18)-(3,37)
(3,44)-(3,45)
(3,44)-(3,52)
(3,50)-(3,52)
(3,59)-(3,60)
*)

(* type error slice
(2,4)-(3,62)
(2,21)-(3,60)
(3,3)-(3,60)
(3,3)-(3,60)
(3,18)-(3,29)
(3,18)-(3,37)
(3,18)-(3,52)
(3,18)-(3,52)
(3,18)-(3,52)
(3,44)-(3,52)
(3,59)-(3,60)
*)
