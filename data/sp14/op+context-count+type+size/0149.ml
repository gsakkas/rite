
let rec digitsOfInt n =
  if n < 0
  then []
  else (match n with | 0 -> [] | _ -> [digitsOfInt (n / 10); n mod 10]);;


(* fix

let rec digitsOfInt n =
  if n < 0
  then []
  else (match n with | 0 -> [] | _ -> (digitsOfInt (n / 10)) @ [n mod 10]);;

*)

(* changed spans
(5,39)-(5,71)
(5,40)-(5,59)
(5,62)-(5,70)
*)

(* type error slice
(2,4)-(5,74)
(2,21)-(5,71)
(3,3)-(5,71)
(5,9)-(5,71)
(5,39)-(5,71)
(5,39)-(5,71)
(5,40)-(5,51)
(5,40)-(5,59)
*)
