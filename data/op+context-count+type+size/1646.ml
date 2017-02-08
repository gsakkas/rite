
let rec digitsOfInt n = if n <= 0 then [] else [n mod (10 n)];;


(* fix

let rec digitsOfInt n = if n <= 0 then [] else [n];;

*)

(* changed spans
(2,49)-(2,60)
(2,56)-(2,60)
*)

(* type error slice
(2,56)-(2,58)
(2,56)-(2,60)
*)
