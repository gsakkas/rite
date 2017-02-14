
let rec digitsOfInt n =
  if n != 0
  then
    (if n > 0
     then (digitsOfInt (n / 10)) @ [n mod 10]
     else (digitsOfInt n) * (-1))
  else [];;


(* fix

let rec digitsOfInt n =
  if n != 0
  then
    (if n > 0
     then (digitsOfInt (n / 10)) @ [n mod 10]
     else digitsOfInt (n * (-1)))
  else [];;

*)

(* changed spans
(7,12)-(7,32)
(7,24)-(7,25)
*)

(* type error slice
(5,6)-(7,32)
(5,6)-(7,32)
(6,12)-(6,23)
(6,12)-(6,31)
(6,12)-(6,46)
(6,34)-(6,35)
(7,12)-(7,23)
(7,12)-(7,25)
(7,12)-(7,32)
(7,12)-(7,32)
*)
