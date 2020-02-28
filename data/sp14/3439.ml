
let rec sumList xs = let x::t = xs in x + (if t != [] then sumList t);;


(* fix

let rec sumList xs = let x::t = xs in x + (if t = [] then 0 else sumList t);;

*)

(* changed spans
(2,47)-(2,54)
t = []
BopG VarG (ListG [])

(2,60)-(2,69)
0
LitG

(2,69)-(2,69)
sumList t
AppG [VarG]

*)

(* type error slice
(2,4)-(2,72)
(2,17)-(2,70)
(2,22)-(2,70)
(2,39)-(2,70)
(2,43)-(2,70)
(2,60)-(2,67)
(2,60)-(2,69)
(2,69)-(2,69)
*)
