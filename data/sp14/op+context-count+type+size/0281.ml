
let rec digitsOfInt n =
  if n < 0
  then []
  else (match n with | 0 -> [0] | _ -> [digitsOfInt (n / 10); n mod 10]);;


(* fix

let rec digitsOfInt n =
  if n < 0
  then []
  else (match n with | 0 -> [0] | _ -> (digitsOfInt (n / 10)) @ [n mod 10]);;

*)

(* changed spans
(5,39)-(5,71)
(5,40)-(5,60)
(5,62)-(5,70)
*)

(* type error slice
(2,3)-(5,74)
(2,20)-(5,72)
(3,2)-(5,72)
(5,7)-(5,72)
(5,28)-(5,31)
(5,39)-(5,71)
(5,39)-(5,71)
(5,40)-(5,51)
(5,40)-(5,60)
(5,62)-(5,70)
*)
