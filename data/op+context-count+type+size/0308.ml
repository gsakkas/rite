
let rec digitsOfInt n =
  if n <= 0 then [] else [digitsOfInt (n / 10); n mod 10];;



let rec digitsOfInt n =
  if n <= 0 then [] else (n mod 10) :: (digitsOfInt (n / 10));;


(* changed spans
(3,26)-(3,38)
(3,42)-(3,43)
(3,47)-(3,48)
(3,51)-(3,54)
(3,57)-(3,58)
*)

(* type error slice
(3,27)-(3,46)
*)
