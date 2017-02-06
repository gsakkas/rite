
let rec digOfIntHelper h = match h > 0 with | true  -> 1 | false  -> 0;;

let rec digitsOfInt n =
  match n > 0 with | true  -> [digOfIntHelper; n mod 10] | false  -> [];;


(* fix

let rec digOfIntHelper h = match h > 0 with | true  -> 1 | false  -> 0;;

let rec digitsOfInt n =
  match n > 0 with | true  -> [digOfIntHelper n; n mod 10] | false  -> [];;

*)

(* changed spans
(5,32)-(5,46)
(5,48)-(5,56)
*)

(* type error slice
(2,4)-(2,73)
(2,24)-(2,71)
(2,28)-(2,71)
(2,28)-(2,71)
(2,28)-(2,71)
(2,34)-(2,35)
(2,34)-(2,39)
(2,34)-(2,39)
(2,34)-(2,39)
(2,38)-(2,39)
(2,56)-(2,57)
(2,70)-(2,71)
(4,4)-(5,74)
(4,21)-(5,72)
(5,3)-(5,72)
(5,3)-(5,72)
(5,3)-(5,72)
(5,9)-(5,10)
(5,9)-(5,14)
(5,9)-(5,14)
(5,9)-(5,14)
(5,13)-(5,14)
(5,31)-(5,57)
(5,31)-(5,57)
(5,31)-(5,57)
(5,32)-(5,46)
(5,48)-(5,49)
(5,48)-(5,56)
(5,54)-(5,56)
(5,70)-(5,72)
*)
