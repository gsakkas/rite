
let rec digitsOfInt n =
  if n <= 0 then [] else (n mod 10) @ (digitsOfInt (n / 10));;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(3,27)-(3,59)
(3,37)-(3,38)
*)

(* type error slice
(3,27)-(3,35)
(3,27)-(3,59)
(3,37)-(3,38)
*)
