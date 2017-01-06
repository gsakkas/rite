
let rec digitsOfInt n =
  if n < 0 then [] else (digitsOfInt (n / 10)) @ (n mod 10);;



let rec digitsOfInt n =
  if n < 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;


(* changed spans
(3,50)-(3,51)
(3,59)-(3,60)
*)

(* type error slice
(3,26)-(3,59)
*)
