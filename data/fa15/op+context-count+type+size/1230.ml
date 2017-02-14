
let rec digitsOfInt n = if n < 0 then 0;;


(* fix

let rec digitsOfInt n = if n < 0 then [] else [1; 2];;

*)

(* changed spans
(2,25)-(2,40)
(2,39)-(2,40)
*)

(* type error slice
(2,25)-(2,40)
(2,25)-(2,40)
(2,25)-(2,40)
(2,39)-(2,40)
*)
