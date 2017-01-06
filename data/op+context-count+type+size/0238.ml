
let rec digitsOfInt n =
  if n <= 0 then [] else [digitsOfInt (n / 10); n mod 10];;



let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;


(* changed spans
(3,26)-(3,27)
(3,47)-(3,48)
*)

(* type error slice
(3,27)-(3,46)
*)
