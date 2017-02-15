
let rec digitsOfInt n =
  if n < 0
  then []
  else
    if n == 0
    then [0]
    else
      if (n / 10) == 0 then n mod 10 else (digitsOfInt (n / 10)) @ [n mod 10];;


(* fix

let rec digitsOfInt n =
  if n < 0
  then []
  else
    if n == 0
    then [0]
    else
      if (n / 10) == 0
      then [n mod 10]
      else (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(9,28)-(9,36)
*)

(* type error slice
(6,4)-(9,77)
(6,4)-(9,77)
(7,9)-(7,12)
(9,6)-(9,77)
(9,6)-(9,77)
(9,28)-(9,36)
(9,42)-(9,77)
(9,65)-(9,66)
*)
