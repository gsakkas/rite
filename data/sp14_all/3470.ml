
let rec digitsOfInt n =
  if n <= 0 then [] else ((n mod 10) :: (digitsOfInt (n / 10))) List.rev;;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(3,26)-(3,73)
(n mod 10) :: (digitsOfInt (n / 10))
AppG [BopG EmptyG EmptyG,AppG [EmptyG]]

*)

(* type error slice
(3,26)-(3,64)
(3,26)-(3,73)
*)
