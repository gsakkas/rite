
let rec digitsOfInt n =
  if n < 0
  then []
  else if n < 10 then [n] else (digitsOfInt (n / 10)) @ (n mod 10);;


(* fix

let rec digitsOfInt n =
  if n < 0
  then []
  else if n < 10 then [n] else (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(5,56)-(5,66)
*)

(* type error slice
(5,31)-(5,66)
(5,54)-(5,55)
(5,56)-(5,66)
*)
