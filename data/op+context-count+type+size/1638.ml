
let rec digitsOfInt n =
  if n <= 0 then [] else ((n mod 10) :: (digitsOfInt (n / 10))) List.rev;;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(3,28)-(3,73)
(3,65)-(3,73)
*)

(* type error slice
(3,28)-(3,61)
(3,28)-(3,73)
(3,65)-(3,73)
*)
