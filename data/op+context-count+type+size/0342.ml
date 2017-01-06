
let rec digitsOfInt n =
  if n < 0
  then []
  else if n = 0 then [] else [digitsOfInt (n / 10); n mod 10];;



let rec digitsOfInt n =
  if n < 0
  then []
  else if n = 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;


(* changed spans
(5,30)-(5,31)
(5,51)-(5,52)
*)

(* type error slice
(5,31)-(5,50)
*)
