
let rec digitsOfInt n = if n > 0 then [digitsOfInt (n / 10)] else [];;


(* fix

let rec digitsOfInt n = if n > 0 then digitsOfInt (n / 10) else [];;

*)

(* changed spans
(2,38)-(2,60)
*)

(* type error slice
(2,3)-(2,70)
(2,20)-(2,68)
(2,24)-(2,68)
(2,38)-(2,60)
(2,38)-(2,60)
(2,39)-(2,50)
(2,39)-(2,59)
*)
