
let rec digitsOfInt n =
  if n <= 0 then [] else (n mod 10) :: [] :: (digitsOfInt (n mod 10));;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else [n mod 10] @ (digitsOfInt (n / 10));;

*)

(* changed spans
(3,25)-(3,35)
(3,25)-(3,69)
(3,39)-(3,41)
(3,39)-(3,69)
(3,58)-(3,68)
*)

(* type error slice
(3,25)-(3,35)
(3,25)-(3,69)
(3,25)-(3,69)
(3,39)-(3,41)
(3,39)-(3,69)
(3,39)-(3,69)
*)
