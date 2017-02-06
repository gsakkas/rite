
let rec digitsOfInt n = if n < 0 then [] else n mod 10;;


(* fix

let rec digitsOfInt n = if n < 0 then [] else digitsOfInt (n / 10);;

*)

(* changed spans
(2,47)-(2,48)
(2,47)-(2,55)
*)

(* type error slice
(2,4)-(2,57)
(2,21)-(2,55)
(2,25)-(2,55)
(2,25)-(2,55)
(2,28)-(2,29)
(2,28)-(2,33)
(2,28)-(2,33)
(2,28)-(2,33)
(2,32)-(2,33)
(2,39)-(2,41)
(2,47)-(2,48)
(2,47)-(2,55)
(2,53)-(2,55)
*)
