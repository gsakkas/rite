
let rec digitsOfInt n =
  if n < 0
  then []
  else
    if n = 0 then [0] else if n > 0 then (digitsOfInt (n / 10)) @ [n mod 10];;


(* fix

let rec digitsOfInt n =
  if n < 0
  then []
  else if n = 0 then [n] else (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(6,20)-(6,21)
(6,28)-(6,77)
(6,31)-(6,36)
(6,35)-(6,36)
*)

(* type error slice
(6,28)-(6,77)
(6,43)-(6,77)
(6,65)-(6,66)
(6,67)-(6,77)
(6,68)-(6,76)
*)
