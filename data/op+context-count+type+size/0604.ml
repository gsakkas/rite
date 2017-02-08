
let rec digitsOfInt n =
  if n > 0 then ((digitsOfInt n) / 10) :: (n mod 10) else [];;


(* fix

let rec digitsOfInt n = if n > 0 then [n / 10; n mod 10] else [];;

*)

(* changed spans
(3,19)-(3,30)
(3,19)-(3,32)
(3,19)-(3,52)
*)

(* type error slice
(2,4)-(3,63)
(2,21)-(3,61)
(3,3)-(3,61)
(3,19)-(3,30)
(3,19)-(3,32)
(3,19)-(3,38)
(3,19)-(3,52)
(3,19)-(3,52)
(3,44)-(3,52)
*)
