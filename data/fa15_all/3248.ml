
let pipe fs = let f a x x = x a in let base y = y in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x = let c y = x (a y) in c in
  let base = let g y = y in g in List.fold_left f base fs;;

*)

(* changed spans
(2,25)-(2,32)
let c = fun y -> x (a y) in c
LetG NonRec (fromList [(VarPatG,LamG VarPatG EmptyG)]) VarG

(2,45)-(2,50)
let g = fun y -> y in g
LetG NonRec (fromList [(VarPatG,LamG VarPatG EmptyG)]) VarG

*)

(* type error slice
(2,15)-(2,78)
(2,21)-(2,32)
(2,23)-(2,32)
(2,25)-(2,32)
(2,29)-(2,30)
(2,29)-(2,32)
(2,31)-(2,32)
(2,54)-(2,68)
(2,54)-(2,78)
(2,69)-(2,70)
*)
