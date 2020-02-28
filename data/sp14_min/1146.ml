
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
[n mod 10]
ListG [BopG EmptyG EmptyG]

*)

(* type error slice
(9,7)-(9,78)
(9,29)-(9,37)
(9,43)-(9,78)
(9,66)-(9,67)
*)
