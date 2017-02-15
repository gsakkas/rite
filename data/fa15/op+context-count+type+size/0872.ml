
let rec digitsOfInt n =
  if n <= 0 then [] else (n mod 10) @ ([] @ (digitsOfInt (n / 10)));;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(3,25)-(3,67)
(3,36)-(3,37)
(3,38)-(3,67)
(3,39)-(3,41)
(3,42)-(3,43)
(3,58)-(3,59)
*)

(* type error slice
(3,25)-(3,35)
(3,25)-(3,67)
(3,36)-(3,37)
*)
