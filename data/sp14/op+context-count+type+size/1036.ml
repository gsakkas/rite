
let rec digitsOfInt n = if n < 0 then [] else (digitsOfInt n) mod 10;;


(* fix

let rec digitsOfInt n = if n < 0 then [] else digitsOfInt (n / 10);;

*)

(* changed spans
(2,48)-(2,69)
(2,60)-(2,61)
*)

(* type error slice
(2,4)-(2,71)
(2,21)-(2,69)
(2,25)-(2,69)
(2,25)-(2,69)
(2,39)-(2,41)
(2,48)-(2,59)
(2,48)-(2,61)
(2,48)-(2,69)
(2,48)-(2,69)
*)
