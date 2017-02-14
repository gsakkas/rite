
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
(9,29)-(9,37)
*)

(* type error slice
(6,5)-(9,78)
(6,5)-(9,78)
(7,10)-(7,13)
(9,7)-(9,78)
(9,7)-(9,78)
(9,29)-(9,37)
(9,44)-(9,78)
(9,66)-(9,67)
*)
