
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
(5,30)-(5,56)
(5,31)-(5,45)
(5,47)-(5,55)
*)
