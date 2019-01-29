
let pipe fs = let f a x x = a in let base y = y in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x y = x y in let base y = y in List.fold_left f base fs;;

*)

(* changed spans
(2,28)-(2,29)
fun y -> x y
LamG (AppG (fromList [EmptyG]))

(2,33)-(2,75)
x
VarG

(2,33)-(2,75)
y
VarG

(2,33)-(2,75)
x y
AppG (fromList [VarG])

*)
