
let rec sumList xs = function | [] -> 0 | xf::xb -> xf + (sumList xb);;


(* fix

let rec sumList xs = match xs with | [] -> 0 | xf::xb -> xf + (sumList xb);;

*)

(* changed spans
(2,22)-(2,70)
match xs with
| [] -> 0
| xf :: xb -> xf + sumList xb
CaseG VarG (fromList [(ConsPatG VarPatG VarPatG,Nothing,BopG EmptyG EmptyG),(ConPatG Nothing,Nothing,LitG)])

*)

(* type error slice
(2,4)-(2,72)
(2,17)-(2,70)
(2,22)-(2,70)
(2,53)-(2,70)
(2,58)-(2,70)
(2,59)-(2,66)
*)
