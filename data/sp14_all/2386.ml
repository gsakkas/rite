
let rec digitsOfInt n =
  if n > 0 then (n mod 10) :: ((digitsOfInt n) / 10) else [];;


(* fix

let rec digitsOfInt n =
  if n > 0 then (n mod 10) :: (digitsOfInt (n / 10)) else [];;

*)

(* changed spans
(3,31)-(3,53)
digitsOfInt (n / 10)
AppG [BopG EmptyG EmptyG]

*)

(* type error slice
(2,4)-(3,63)
(2,21)-(3,61)
(3,3)-(3,61)
(3,17)-(3,53)
(3,31)-(3,53)
(3,32)-(3,47)
(3,33)-(3,44)
(3,59)-(3,61)
*)
