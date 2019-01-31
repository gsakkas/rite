
let identity a = a;;

let pipe fs =
  let f a x x = x a in let base = identity in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x y = x (a y) in let base m = m in List.fold_left f base fs;;

*)

(* changed spans
(5,12)-(5,19)
fun y -> x (a y)
LamG (AppG (fromList [EmptyG]))

(5,18)-(5,19)
a y
AppG (fromList [VarG])

(5,23)-(5,70)
y
VarG

(5,34)-(5,42)
fun m -> m
LamG VarG

(5,46)-(5,70)
m
VarG

*)
