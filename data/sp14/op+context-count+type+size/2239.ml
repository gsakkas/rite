
let rec digitsOfInt n =
  if n > 0 then (digitsOfInt (n mod 10)) :: (n / 10) else [];;


(* fix

let rec digitsOfInt n =
  if n > 0 then (n mod 10) :: (digitsOfInt (n / 10)) else [];;

*)

(* changed spans
(3,16)-(3,40)
(3,17)-(3,28)
(3,44)-(3,52)
*)

(* type error slice
(2,3)-(3,62)
(2,20)-(3,60)
(3,2)-(3,60)
(3,16)-(3,40)
(3,16)-(3,52)
(3,16)-(3,52)
(3,16)-(3,52)
(3,17)-(3,28)
(3,44)-(3,52)
*)
