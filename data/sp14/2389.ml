
let rec digOfIntHelper h = match h > 0 with | true  -> 1 | false  -> 0;;

let rec digitsOfInt n =
  match n > 0 with | true  -> [digOfIntHelper; n mod 10] | false  -> [];;


(* fix

let rec digOfIntHelper h = match h > 0 with | true  -> 1 | false  -> 0;;

let rec digitsOfInt n =
  match n > 0 with | true  -> [digOfIntHelper n; n mod 10] | false  -> [];;

*)

(* changed spans
(5,31)-(5,45)
(5,47)-(5,55)
*)

(* type error slice
(2,3)-(2,72)
(2,23)-(2,70)
(5,30)-(5,56)
(5,31)-(5,45)
(5,47)-(5,55)
*)

(* all spans
(2,23)-(2,70)
(2,27)-(2,70)
(2,33)-(2,38)
(2,33)-(2,34)
(2,37)-(2,38)
(2,55)-(2,56)
(2,69)-(2,70)
(4,20)-(5,71)
(5,2)-(5,71)
(5,8)-(5,13)
(5,8)-(5,9)
(5,12)-(5,13)
(5,30)-(5,56)
(5,31)-(5,45)
(5,47)-(5,55)
(5,47)-(5,48)
(5,53)-(5,55)
(5,69)-(5,71)
*)
