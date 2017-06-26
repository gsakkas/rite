
let rec digitsOfInt n = if n > 0 then (digitsOfInt (n mod 10)) @ [];;


(* fix

let rec digitsOfInt n = if n > 0 then (digitsOfInt (n mod 10)) @ [] else [];;

*)

(* changed spans
(2,24)-(2,67)
*)

(* type error slice
(2,24)-(2,67)
(2,38)-(2,67)
(2,63)-(2,64)
*)

(* all spans
(2,20)-(2,67)
(2,24)-(2,67)
(2,27)-(2,32)
(2,27)-(2,28)
(2,31)-(2,32)
(2,38)-(2,67)
(2,63)-(2,64)
(2,38)-(2,62)
(2,39)-(2,50)
(2,51)-(2,61)
(2,52)-(2,53)
(2,58)-(2,60)
(2,65)-(2,67)
*)
