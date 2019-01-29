
let pipe fs = let f a x = fs a in let base = 0 in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x y = x (a y) in let base y = y in List.fold_left f base fs;;

*)

(* changed spans
(2,26)-(2,28)
x
VarG

(2,26)-(2,30)
fun y -> x (a y)
LamG (AppG (fromList [EmptyG]))

(2,29)-(2,30)
a y
AppG (fromList [VarG])

(2,34)-(2,74)
y
VarG

(2,45)-(2,46)
fun y -> y
LamG VarG

(2,50)-(2,74)
y
VarG

*)
