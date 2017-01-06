
let rec digitsOfInt n =
  if n < 0
  then []
  else
    if n = 0 then [0] else if n > 0 then (digitsOfInt (n / 10)) @ [n mod 10];;



let rec digitsOfInt n =
  if n < 0
  then []
  else if n = 0 then [n] else (digitsOfInt (n / 10)) @ [n mod 10];;


(* changed spans
(6,20)-(6,21)
(6,28)-(6,41)
*)

(* type error slice
(6,43)-(6,77)
*)
