
let pipe fs = let f a x d = x a in let base = 0 in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x y = x (a y) in let base i = i in List.fold_left f base fs;;

*)

(* changed spans
(2,24)-(2,31)
fun y -> x (a y)
LamG (AppG (fromList [EmptyG]))

(2,30)-(2,31)
a y
AppG (fromList [VarG])

(2,35)-(2,75)
y
VarG

(2,46)-(2,47)
fun i -> i
LamG VarG

(2,51)-(2,75)
i
VarG

*)
