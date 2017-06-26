
let rec digitsOfInt n = if n < 0 then [] else (digitsOfInt n) / 1;;


(* fix

let rec digitsOfInt n = if n < 0 then [] else digitsOfInt (n / 10);;

*)

(* changed spans
(2,46)-(2,65)
(2,59)-(2,60)
(2,64)-(2,65)
*)

(* type error slice
(2,24)-(2,65)
(2,38)-(2,40)
(2,46)-(2,65)
*)

(* all spans
(2,20)-(2,65)
(2,24)-(2,65)
(2,27)-(2,32)
(2,27)-(2,28)
(2,31)-(2,32)
(2,38)-(2,40)
(2,46)-(2,65)
(2,46)-(2,61)
(2,47)-(2,58)
(2,59)-(2,60)
(2,64)-(2,65)
*)
