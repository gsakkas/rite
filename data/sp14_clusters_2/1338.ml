
let pipe fs = let f a x x = a in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x y = y in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(2,28)-(2,29)
fun y -> y
LamG VarG

(2,33)-(2,75)
y
VarG

*)
