
let pipe fs = let f a x = a x in let base = 0 in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x = function | g -> g in
  let base = function | x -> x in List.fold_left f base fs;;

*)

(* changed spans
(2,27)-(2,30)
function | g -> g
LamG VarPatG (CaseG (fromList [(VarPatG,Nothing,EmptyG)]))

(2,45)-(2,46)
function | x -> x
LamG VarPatG (CaseG (fromList [(VarPatG,Nothing,EmptyG)]))

*)

(* type error slice
(2,15)-(2,74)
(2,21)-(2,30)
(2,23)-(2,30)
(2,27)-(2,28)
(2,27)-(2,30)
(2,50)-(2,64)
(2,50)-(2,74)
(2,65)-(2,66)
*)
