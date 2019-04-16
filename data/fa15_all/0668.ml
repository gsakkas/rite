
let rec sumList xs = function | [] -> 0 | x::1 -> x + (sumList xs);;


(* fix

let rec sumList xs = match xs with | [] -> 0 | xf::xb -> xf + (sumList xb);;

*)

(* changed spans
(2,22)-(2,67)
match xs with
| [] -> 0
| xf :: xb -> xf + sumList xb
CaseG VarG (fromList [(ConsPatG VarPatG VarPatG,Nothing,BopG EmptyG EmptyG),(ConPatG Nothing,Nothing,LitG)])

*)

(* type error slice
(2,4)-(2,69)
(2,17)-(2,67)
(2,22)-(2,67)
(2,51)-(2,67)
(2,55)-(2,67)
(2,56)-(2,63)
*)
