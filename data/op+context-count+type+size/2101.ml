
let rec digitsOfInt n = if n > 10 then [n; n mod 10] else n;;


(* fix

let rec digitsOfInt n = if n >= 100 then [n mod 10] else [n];;

*)

(* changed spans
(2,28)-(2,29)
(2,28)-(2,34)
(2,32)-(2,34)
(2,40)-(2,53)
(2,44)-(2,52)
(2,59)-(2,60)
*)

(* type error slice
(2,25)-(2,60)
(2,28)-(2,29)
(2,28)-(2,34)
(2,32)-(2,34)
(2,40)-(2,53)
(2,41)-(2,42)
(2,59)-(2,60)
*)
