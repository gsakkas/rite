
let rec digitsOfInt n = if n <= 0 then [] else [digitsOfInt (n / 10)];;



let rec digitsOfInt n =
  if n <= 0 then [] else (n mod 10) :: (digitsOfInt (n / 10));;


(* changed spans
(2,48)-(2,49)
(2,69)-(2,70)
*)

(* type error slice
(2,49)-(2,68)
*)
