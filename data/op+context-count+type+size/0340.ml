
let rec digitsOfInt n = if n < 0 then [] else [digitsOfInt (n / 10)];;



let rec digitsOfInt n = if n < 0 then [] else digitsOfInt (n / 10);;


(* changed spans
(2,47)-(2,48)
(2,68)-(2,69)
*)

(* type error slice
(2,48)-(2,67)
*)
