
let rec digitsOfInt n = if n <= 0 then [] else n mod 10;;


(* fix

let rec digitsOfInt n = if n <= 0 then [] else [n];;

*)

(* changed spans
(2,48)-(2,56)
[n]
ListG [VarG]

*)

(* type error slice
(2,25)-(2,56)
(2,40)-(2,42)
(2,48)-(2,56)
*)
