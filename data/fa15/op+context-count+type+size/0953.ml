
let rec digitsOfInt n =
  if n < 0 then [] else (n mod 10) :: [] :: (digitsOfInt (n / 10));;


(* fix

let rec digitsOfInt n =
  if n < 0 then [] else (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(3,39)-(3,41)
(3,39)-(3,65)
*)

(* type error slice
(3,26)-(3,34)
(3,26)-(3,65)
(3,26)-(3,65)
(3,39)-(3,41)
(3,39)-(3,65)
(3,39)-(3,65)
*)
