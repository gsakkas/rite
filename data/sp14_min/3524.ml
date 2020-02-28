
let rec digitsOfInt n = if n < 0 then [] else n mod 10;;


(* fix

let rec digitsOfInt n = if n < 0 then [] else digitsOfInt (n / 10);;

*)

(* changed spans
(2,47)-(2,55)
digitsOfInt (n / 10)
AppG [BopG EmptyG EmptyG]

*)

(* type error slice
(2,25)-(2,55)
(2,39)-(2,41)
(2,47)-(2,55)
*)
