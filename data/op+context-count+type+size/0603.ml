
let rec digitsOfInt n =
  if n > 0 then (digitsOfInt (n / 10)) :: (n mod 10) else [];;


(* fix

let rec digitsOfInt n = if n > 0 then [n / 10; n mod 10] else [];;

*)

(* changed spans
(3,18)-(3,29)
(3,18)-(3,37)
(3,18)-(3,52)
*)

(* type error slice
(2,4)-(3,63)
(2,21)-(3,61)
(3,3)-(3,61)
(3,18)-(3,29)
(3,18)-(3,37)
(3,18)-(3,52)
(3,18)-(3,52)
(3,18)-(3,52)
(3,44)-(3,52)
*)
