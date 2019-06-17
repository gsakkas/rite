
let rec digitsOfInt n = if n <= 0 then [] else 1;;


(* fix

let rec digitsOfInt n = if n <= 0 then [] else [1];;

*)

(* changed spans
(2,48)-(2,49)
[1]
ListG [LitG]

*)

(* type error slice
(2,25)-(2,49)
(2,40)-(2,42)
(2,48)-(2,49)
*)
