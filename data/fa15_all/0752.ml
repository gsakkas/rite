
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
(7,11)-(7,33)
digitsOfInt (n * (-1))
AppG [BopG EmptyG EmptyG]

*)

(* type error slice
(5,5)-(7,34)
(6,11)-(6,33)
(6,11)-(6,46)
(6,12)-(6,23)
(6,34)-(6,35)
(7,11)-(7,26)
(7,11)-(7,33)
(7,12)-(7,23)
*)
