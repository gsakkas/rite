
let rec digitsOfInt n =
  if n <= 0 then [] else ((digitsOfInt n) / 10) @ [n mod 10];;



let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;


(* changed spans
(3,27)-(3,28)
(3,41)-(3,42)
*)

(* type error slice
(3,28)-(3,61)
*)
