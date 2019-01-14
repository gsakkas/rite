
let pipe fs = let f a x = x a in let base = fs in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x y = x (a y) in let base fs = fs in List.fold_left f base fs;;

*)

(* changed spans
(2,26)-(2,29)
fun y -> x (a y)
LamG (AppG (fromList [EmptyG]))

(2,28)-(2,29)
a y
AppG (fromList [VarG])

(2,33)-(2,74)
y
VarG

(2,44)-(2,46)
fun fs -> fs
LamG VarG

*)
