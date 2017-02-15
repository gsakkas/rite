
let rec digitsOfInt n =
  if n > 0 then [digitsOfInt ((n - (n mod 10)) / 10); n mod 10] else [];;


(* fix

let rec digitsOfInt n =
  if n > 0 then (digitsOfInt ((n - (n mod 10)) / 10)) @ [n mod 10] else [];;

*)

(* changed spans
(3,16)-(3,63)
(3,17)-(3,52)
(3,54)-(3,62)
*)

(* type error slice
(2,3)-(3,73)
(2,20)-(3,71)
(3,2)-(3,71)
(3,16)-(3,63)
(3,16)-(3,63)
(3,17)-(3,28)
(3,17)-(3,52)
*)
