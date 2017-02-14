
let rec digitsOfInt n =
  if n <= 0 then [] else (n mod 10) :: [] :: (digitsOfInt (n mod 10));;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else [n mod 10] @ (digitsOfInt (n / 10));;

*)

(* changed spans
(3,27)-(3,35)
(3,27)-(3,68)
(3,40)-(3,42)
(3,40)-(3,68)
(3,60)-(3,68)
*)

(* type error slice
(3,27)-(3,35)
(3,27)-(3,68)
(3,27)-(3,68)
(3,40)-(3,42)
(3,40)-(3,68)
(3,40)-(3,68)
*)
