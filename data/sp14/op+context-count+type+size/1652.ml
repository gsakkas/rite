
let rec digitsOfInt n =
  if n <= 0 then [] else ((n mod 10) :: (digitsOfInt (n / 10))) List.rev;;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(3,25)-(3,72)
(3,64)-(3,72)
*)

(* type error slice
(3,25)-(3,63)
(3,25)-(3,72)
*)
