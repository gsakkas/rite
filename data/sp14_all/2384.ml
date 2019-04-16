
let rec digitsOfInt n =
  if n > 0 then (digitsOfInt (n mod 10)) :: (n / 10) else [];;


(* fix

let rec digitsOfInt n =
  if n > 0 then (n mod 10) :: (digitsOfInt (n / 10)) else [];;

*)

(* changed spans
(3,17)-(3,41)
n mod 10
BopG VarG LitG

(3,45)-(3,53)
digitsOfInt (n / 10)
AppG (fromList [BopG EmptyG EmptyG])

*)

(* type error slice
(2,4)-(3,63)
(2,21)-(3,61)
(3,3)-(3,61)
(3,17)-(3,41)
(3,17)-(3,53)
(3,18)-(3,29)
(3,45)-(3,53)
*)
