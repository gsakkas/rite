
let rec sumList xs = function | [] -> 0 | x::xs -> x + (sumList xs);;


(* fix

let rec sumList xs = match xs with | [] -> 0 | xf::xb -> xf + (sumList xb);;

*)

(* changed spans
(2,21)-(2,67)
match xs with
| [] -> 0
| xf :: xb -> xf + sumList xb
CaseG VarG (fromList [(Nothing,BopG EmptyG EmptyG),(Nothing,LitG)])

(2,38)-(2,39)
xs
VarG

(2,51)-(2,52)
xf
VarG

(2,64)-(2,66)
xb
VarG

*)
