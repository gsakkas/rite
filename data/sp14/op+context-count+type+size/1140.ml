
let rec digitsOfInt n = if n > 0 then [digitsOfInt (n / 10); n mod 10] else 0;;


(* fix

let rec digitsOfInt n =
  if n > 0 then (digitsOfInt (n / 10)) @ [n mod 10] else [];;

*)

(* changed spans
(2,38)-(2,70)
(2,39)-(2,59)
(2,61)-(2,69)
(2,76)-(2,77)
*)

(* type error slice
(2,3)-(2,79)
(2,20)-(2,77)
(2,24)-(2,77)
(2,24)-(2,77)
(2,38)-(2,70)
(2,38)-(2,70)
(2,39)-(2,50)
(2,39)-(2,59)
(2,76)-(2,77)
*)
