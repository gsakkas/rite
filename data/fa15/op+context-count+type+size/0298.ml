
let rec digitsOfInt n = if n > 0 then [digitsOfInt (n / 10)] else [];;


(* fix

let rec digitsOfInt n = if n > 0 then digitsOfInt (n / 10) else [];;

*)

(* changed spans
(2,39)-(2,61)
*)

(* type error slice
(2,4)-(2,71)
(2,21)-(2,69)
(2,25)-(2,69)
(2,39)-(2,61)
(2,39)-(2,61)
(2,40)-(2,51)
(2,40)-(2,59)
*)
