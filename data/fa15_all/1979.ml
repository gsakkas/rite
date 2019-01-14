
let pipe fs = let f a x = x @ a in let base = 0 in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x b = x b in let base b = b in List.fold_left f base fs;;

*)

(* changed spans
(2,26)-(2,27)
x b
AppG (fromList [VarG])

(2,28)-(2,29)
fun b -> x b
LamG (AppG (fromList [EmptyG]))

(2,30)-(2,31)
b
VarG

(2,46)-(2,47)
fun b -> b
LamG VarG

(2,51)-(2,75)
b
VarG

*)
