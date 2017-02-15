
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
(5,7)-(5,63)
(5,10)-(5,18)
(5,10)-(5,22)
(5,21)-(5,22)
(5,28)-(5,63)
*)

(* type error slice
(5,7)-(5,63)
(5,7)-(5,63)
(5,7)-(5,63)
(5,28)-(5,63)
(5,51)-(5,52)
*)
