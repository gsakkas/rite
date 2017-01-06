
let rec digitsOfInt n =
  if n <= 0 then [] else (n - ((n / 10) * 10)) :: ((digitsOfInt n) / 10);;



let rec digitsOfInt n =
  if n <= 0 then [] else (n - ((n / 10) * 10)) :: (digitsOfInt (n / 10));;


(* changed spans
(3,52)-(3,53)
(3,66)-(3,67)
*)

(* type error slice
(3,27)-(3,72)
*)
