
let rec digitsOfIntHelper n =
  if n < 1
  then []
  else [n mod 10] @ (digitsOfIntHelper (n - ((n mod 10) / 10)));;

let rec digitsOfInt n = digitsOfIntHelper (n >= 10);;


(* fix

let rec digitsOfIntHelper n =
  if n < 1
  then []
  else [n mod 10] @ (digitsOfIntHelper (n - ((n mod 10) / 10)));;

let rec digitsOfInt n = digitsOfIntHelper n;;

*)

(* changed spans
(7,44)-(7,51)
(7,49)-(7,51)
*)

(* type error slice
(5,22)-(5,39)
(5,22)-(5,61)
(5,41)-(5,61)
(7,25)-(7,42)
(7,25)-(7,51)
(7,44)-(7,51)
*)
