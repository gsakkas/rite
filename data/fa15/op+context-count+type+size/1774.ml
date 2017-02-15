
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
(7,42)-(7,51)
(7,48)-(7,50)
*)

(* type error slice
(5,20)-(5,63)
(5,21)-(5,38)
(5,39)-(5,62)
(7,24)-(7,41)
(7,24)-(7,51)
(7,42)-(7,51)
*)
