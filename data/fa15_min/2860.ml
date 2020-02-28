
let pipe fs = let f a x = fs in let base = 0 in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = x in let base y = y in List.fold_left f base fs;;

*)

(* changed spans
(2,27)-(2,29)
x
VarG

(2,44)-(2,45)
fun y -> y
LamG VarPatG VarG

*)

(* type error slice
(2,15)-(2,73)
(2,21)-(2,29)
(2,23)-(2,29)
(2,27)-(2,29)
(2,33)-(2,73)
(2,44)-(2,45)
(2,49)-(2,63)
(2,49)-(2,73)
(2,64)-(2,65)
(2,66)-(2,70)
(2,71)-(2,73)
*)
