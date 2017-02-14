
let rec digitsOfInt n = if n < 0 then [] else [(digitsOfInt n) / 10];;


(* fix

let rec digitsOfInt n = if n > 0 then digitsOfInt (n / 10) else [];;

*)

(* changed spans
(2,28)-(2,33)
(2,39)-(2,41)
(2,47)-(2,69)
(2,49)-(2,68)
(2,61)-(2,62)
*)

(* type error slice
(2,4)-(2,71)
(2,21)-(2,69)
(2,25)-(2,69)
(2,47)-(2,69)
(2,49)-(2,60)
(2,49)-(2,62)
(2,49)-(2,68)
*)
