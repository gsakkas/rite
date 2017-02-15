
let rec digitsOfInt n = if n < 0 then [];;


(* fix

let rec digitsOfInt n = [];;

*)

(* changed spans
(2,24)-(2,40)
(2,27)-(2,32)
*)

(* type error slice
(2,24)-(2,40)
(2,24)-(2,40)
(2,24)-(2,40)
(2,38)-(2,40)
*)
