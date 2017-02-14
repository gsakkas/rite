
let rec digitsOfInt n = if n > 0 then [n mod 10];;


(* fix

let rec digitsOfInt n = if n > 0 then [n mod 10] else [];;

*)

(* changed spans
(2,24)-(2,48)
*)

(* type error slice
(2,24)-(2,48)
(2,24)-(2,48)
(2,24)-(2,48)
(2,38)-(2,48)
*)
