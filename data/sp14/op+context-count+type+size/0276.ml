
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
(6,19)-(6,20)
(6,27)-(6,76)
(6,30)-(6,35)
(6,34)-(6,35)
(6,67)-(6,68)
*)

(* type error slice
(6,27)-(6,76)
(6,27)-(6,76)
(6,27)-(6,76)
(6,41)-(6,76)
(6,64)-(6,65)
*)
