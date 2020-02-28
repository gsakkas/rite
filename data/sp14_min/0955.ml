
let rec digitsOfInt n =
  if n <= 0 then [] else (n - ((n / 10) * 10)) :: ((digitsOfInt n) / 10);;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (n - ((n / 10) * 10)) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(3,51)-(3,73)
digitsOfInt (n / 10)
AppG [BopG EmptyG EmptyG]

*)

(* type error slice
(2,4)-(3,75)
(2,21)-(3,73)
(3,3)-(3,73)
(3,26)-(3,73)
(3,51)-(3,73)
(3,52)-(3,67)
(3,53)-(3,64)
*)
