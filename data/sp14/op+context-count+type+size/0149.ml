
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
(5,38)-(5,70)
(5,39)-(5,59)
(5,61)-(5,69)
*)

(* type error slice
(2,3)-(5,73)
(2,20)-(5,71)
(3,2)-(5,71)
(5,7)-(5,71)
(5,38)-(5,70)
(5,38)-(5,70)
(5,39)-(5,50)
(5,39)-(5,59)
*)
