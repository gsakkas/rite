
let rec digitsOfInt n =
  if n > 0 then ((digitsOfInt n) / 10) :: (n mod 10) else [];;


(* fix

let rec digitsOfInt n = if n > 0 then [n / 10; n mod 10] else [];;

*)

(* changed spans
(3,16)-(3,52)
(3,17)-(3,32)
(3,18)-(3,29)
*)

(* type error slice
(2,3)-(3,62)
(2,20)-(3,60)
(3,2)-(3,60)
(3,16)-(3,38)
(3,16)-(3,52)
(3,16)-(3,52)
(3,17)-(3,32)
(3,18)-(3,29)
(3,42)-(3,52)
*)
