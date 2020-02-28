
let rec digitsOfInt n =
  if n > 0 then (digitsOfInt (n / 10)) :: (n mod 10) else [];;


(* fix

let rec digitsOfInt n = if n > 0 then [n / 10; n mod 10] else [];;

*)

(* changed spans
(3,17)-(3,53)
[n / 10 ; n mod 10]
ListG [BopG EmptyG EmptyG,BopG EmptyG EmptyG]

*)

(* type error slice
(2,4)-(3,63)
(2,21)-(3,61)
(3,3)-(3,61)
(3,17)-(3,39)
(3,17)-(3,53)
(3,18)-(3,29)
(3,43)-(3,53)
*)
