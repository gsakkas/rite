
let rec digitsOfInt n = if n < 0 then [] else (digitsOfInt n) mod 10;;


(* fix

let rec digitsOfInt n = if n < 0 then [] else digitsOfInt (n / 10);;

*)

(* changed spans
(2,46)-(2,68)
(2,59)-(2,60)
*)

(* type error slice
(2,24)-(2,68)
(2,38)-(2,40)
(2,46)-(2,68)
*)

(* all spans
(2,20)-(2,68)
(2,24)-(2,68)
(2,27)-(2,32)
(2,27)-(2,28)
(2,31)-(2,32)
(2,38)-(2,40)
(2,46)-(2,68)
(2,46)-(2,61)
(2,47)-(2,58)
(2,59)-(2,60)
(2,66)-(2,68)
*)
