
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
(2,21)-(5,71)
(3,3)-(5,71)
(3,6)-(3,7)
(3,6)-(3,11)
(4,8)-(4,10)
(5,9)-(5,71)
(5,29)-(5,31)
(5,39)-(5,71)
(5,40)-(5,51)
(5,40)-(5,59)
*)
