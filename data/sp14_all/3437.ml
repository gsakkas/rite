
let rec sumList xs = let x::t = xs in if t != [] then x + (sumList t);;


(* fix

let rec sumList xs = let x::t = xs in x + (if t = [] then 0 else sumList t);;

*)

(* changed spans
(2,39)-(2,70)
x + (if t = []
     then 0
     else sumList t)
BopG VarG (IteG EmptyG EmptyG EmptyG)

*)

(* type error slice
(2,39)-(2,70)
(2,55)-(2,70)
(2,70)-(2,70)
*)
