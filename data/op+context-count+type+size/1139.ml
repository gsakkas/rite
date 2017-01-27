
let rec digitsOfInt n = if n > 0 then [digitsOfInt (n / 10); n mod 10] else 0;;


(* fix

let rec digitsOfInt n =
  if n > 0 then (digitsOfInt (n / 10)) @ [n mod 10] else [];;

*)

(* changed spans
(2,39)-(2,71)
(2,40)-(2,59)
(2,62)-(2,70)
(2,77)-(2,78)
*)

(* type error slice
(2,4)-(2,80)
(2,21)-(2,78)
(2,25)-(2,78)
(2,28)-(2,29)
(2,28)-(2,33)
(2,32)-(2,33)
(2,39)-(2,71)
(2,40)-(2,51)
(2,40)-(2,59)
(2,53)-(2,59)
(2,77)-(2,78)
*)
