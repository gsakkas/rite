
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
(7,10)-(7,32)
(7,23)-(7,24)
*)

(* type error slice
(5,4)-(7,33)
(5,4)-(7,33)
(6,10)-(6,32)
(6,10)-(6,45)
(6,11)-(6,22)
(6,33)-(6,34)
(7,10)-(7,25)
(7,10)-(7,32)
(7,10)-(7,32)
(7,11)-(7,22)
*)
