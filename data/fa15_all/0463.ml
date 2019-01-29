
let pipe fs = let f a x = [fs a] in let base = 0 in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x y = x (a y) in let base y = y in List.fold_left f base fs;;

*)

(* changed spans
(2,26)-(2,32)
fun y -> x (a y)
LamG (AppG (fromList [EmptyG]))

(2,27)-(2,29)
x
VarG

(2,30)-(2,31)
a y
AppG (fromList [VarG])

(2,36)-(2,76)
y
VarG

(2,47)-(2,48)
fun y -> y
LamG VarG

(2,52)-(2,76)
y
VarG

*)
