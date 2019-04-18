
let pipe fs = let f a x = a x in let base = fs in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x = let func y = x (a y) in func in
  let base = let func y = y in func in List.fold_left f base fs;;

*)

(* changed spans
(2,27)-(2,30)
let func = fun y -> x (a y) in
func
LetG NonRec (fromList [(VarPatG,LamG VarPatG EmptyG)]) VarG

(2,45)-(2,47)
let func = fun y -> y in func
LetG NonRec (fromList [(VarPatG,LamG VarPatG EmptyG)]) VarG

*)

(* type error slice
(2,15)-(2,75)
(2,21)-(2,30)
(2,23)-(2,30)
(2,27)-(2,28)
(2,27)-(2,30)
(2,51)-(2,65)
(2,51)-(2,75)
(2,66)-(2,67)
*)
