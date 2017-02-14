
let rec digitsOfInt n = if n < 0 then [] else if n < 10 then [n];;


(* fix

let rec digitsOfInt n = if n < 0 then [] else [];;

*)

(* changed spans
(2,47)-(2,65)
(2,50)-(2,56)
(2,62)-(2,65)
*)

(* type error slice
(2,47)-(2,65)
(2,47)-(2,65)
(2,47)-(2,65)
(2,62)-(2,65)
*)
