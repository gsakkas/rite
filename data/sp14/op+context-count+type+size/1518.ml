
let rec digitsOfInt n =
  if n < 0
  then []
  else if (n / 10) > 0 then (digitsOfInt (n / 10)) @ [n mod 10];;


(* fix

let rec digitsOfInt n =
  if n < 0
  then []
  else if n < 10 then [n] else (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(5,8)-(5,64)
(5,12)-(5,18)
(5,12)-(5,23)
(5,22)-(5,23)
(5,30)-(5,64)
*)

(* type error slice
(5,8)-(5,64)
(5,8)-(5,64)
(5,8)-(5,64)
(5,30)-(5,64)
(5,52)-(5,53)
*)
