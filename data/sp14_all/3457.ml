
let rec digitsOfInt n = if n <= 0 then [] else n mod 10;;


(* fix

let rec digitsOfInt n = if n <= 0 then [] else [n];;

*)

(* changed spans
(2,47)-(2,55)
[n]
ListG VarG Nothing

*)
