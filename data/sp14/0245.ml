
let rec digitsOfInt n = if n < 0 then true;;


(* fix

let rec digitsOfInt n = if n < 0 then [] else [];;

*)

(* changed spans
(2,24)-(2,42)
(2,38)-(2,42)
*)

(* type error slice
(2,24)-(2,42)
(2,38)-(2,42)
*)

(* all spans
(2,20)-(2,42)
(2,24)-(2,42)
(2,27)-(2,32)
(2,27)-(2,28)
(2,31)-(2,32)
(2,38)-(2,42)
*)
