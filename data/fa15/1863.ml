
let rec digitsOfInt n = if n > 0 then [digitsOfInt (n / 10)];;


(* fix

let rec digitsOfInt n = if n < 0 then [] else digitsOfInt (n / 10);;

*)

(* changed spans
(2,24)-(2,60)
(2,27)-(2,32)
(2,38)-(2,60)
*)

(* type error slice
(2,24)-(2,60)
(2,38)-(2,60)
*)

(* all spans
(2,20)-(2,60)
(2,24)-(2,60)
(2,27)-(2,32)
(2,27)-(2,28)
(2,31)-(2,32)
(2,38)-(2,60)
(2,39)-(2,59)
(2,39)-(2,50)
(2,51)-(2,59)
(2,52)-(2,53)
(2,56)-(2,58)
*)
