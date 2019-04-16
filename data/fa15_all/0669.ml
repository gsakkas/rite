
let rec sumList xs = function | [] -> 0 | x::xs -> x + (sumList xs);;


(* fix

let rec sumList xs = match xs with | [] -> 0 | xf::xb -> xf + (sumList xb);;

*)

(* changed spans
(2,22)-(2,68)
match xs with
| [] -> 0
| xf :: xb -> xf + sumList xb
CaseG VarG (fromList [(ConsPatG VarPatG VarPatG,Nothing,BopG EmptyG EmptyG),(ConPatG Nothing,Nothing,LitG)])

*)

(* type error slice
(2,4)-(2,70)
(2,17)-(2,68)
(2,22)-(2,68)
(2,52)-(2,68)
(2,56)-(2,68)
(2,57)-(2,64)
*)
