
let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ (n mod 10);;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(3,27)-(3,46)
(3,27)-(3,60)
(3,49)-(3,50)
(3,52)-(3,53)
(3,52)-(3,60)
(3,58)-(3,60)
*)

(* type error slice
(3,27)-(3,60)
(3,49)-(3,50)
(3,52)-(3,60)
*)
