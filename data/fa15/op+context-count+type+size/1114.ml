
let rec digitsOfInt n = if n < 0 then [] else if n < 10 then [n];;


(* fix

let rec digitsOfInt n = if n < 0 then [] else [];;

*)

(* changed spans
(2,46)-(2,64)
(2,49)-(2,55)
(2,61)-(2,64)
*)

(* type error slice
(2,46)-(2,64)
(2,46)-(2,64)
(2,46)-(2,64)
(2,61)-(2,64)
*)
