
let rec digitsOfInt n =
  if n < 0
  then []
  else if n = 0 then [] else [digitsOfInt (n / 10); n mod 10];;


(* fix

let rec digitsOfInt n =
  if n < 0
  then []
  else if n = 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(5,30)-(5,62)
(5,31)-(5,50)
(5,53)-(5,61)
*)

(* type error slice
(2,21)-(5,62)
(3,3)-(5,62)
(3,6)-(3,7)
(3,6)-(3,11)
(4,8)-(4,10)
(5,8)-(5,62)
(5,22)-(5,24)
(5,30)-(5,62)
(5,31)-(5,42)
(5,31)-(5,50)
*)
