
let rec digitsOfInt n = if n > 10 then [n; n mod 10] else n;;


(* fix

let rec digitsOfInt n = if n >= 100 then [n mod 10] else [n];;

*)

(* changed spans
(2,27)-(2,28)
(2,27)-(2,33)
(2,31)-(2,33)
(2,39)-(2,52)
(2,43)-(2,51)
(2,58)-(2,59)
*)

(* type error slice
(2,24)-(2,59)
(2,24)-(2,59)
(2,39)-(2,52)
(2,39)-(2,52)
(2,40)-(2,41)
(2,58)-(2,59)
*)
