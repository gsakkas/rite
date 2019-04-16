
let rec digitsOfInt n = if n > 0 then [digitsOfInt (n mod 10)] else [];;


(* fix

let rec digitsOfInt n = if n > 0 then [n mod 100; n mod 10] else [];;

*)

(* changed spans
(2,39)-(2,63)
[n mod 100 ; n mod 10]
ListG (fromList [BopG EmptyG EmptyG])

*)

(* type error slice
(2,4)-(2,73)
(2,21)-(2,71)
(2,25)-(2,71)
(2,39)-(2,63)
(2,40)-(2,51)
(2,40)-(2,62)
*)
