
let rec digitsOfInt n =
  if n < 0 then [] else (n mod 10) :: [] :: (digitsOfInt (n / 10));;


(* fix

let rec digitsOfInt n =
  if n < 0 then [] else (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(3,39)-(3,67)
digitsOfInt (n / 10)
AppG [BopG EmptyG EmptyG]

*)

(* type error slice
(3,25)-(3,35)
(3,25)-(3,67)
(3,39)-(3,41)
(3,39)-(3,67)
*)
