
let rec digitsOfIntHelper n =
  if n < 1
  then []
  else [n mod 10] @ (digitsOfIntHelper (n - ((n mod 10) / 10)));;

let rec digitsOfInt n = digitsOfIntHelper (n > 10);;


(* fix

let rec digitsOfIntHelper n =
  if n < 1
  then []
  else [n mod 10] @ (digitsOfIntHelper (n - ((n mod 10) / 10)));;

let rec digitsOfInt n = digitsOfIntHelper n;;

*)

(* changed spans
(7,43)-(7,51)
n
VarG

*)

(* type error slice
(5,21)-(5,64)
(5,22)-(5,39)
(5,40)-(5,63)
(7,25)-(7,42)
(7,25)-(7,51)
(7,43)-(7,51)
*)
