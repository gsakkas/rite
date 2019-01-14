
let pipe fs = let f a x = a x in let base = 0 in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x b = x (a b) in let base i = i in List.fold_left f base fs;;

*)

(* changed spans
(2,26)-(2,29)
fun b -> x (a b)
LamG (AppG (fromList [EmptyG]))

(2,33)-(2,73)
a
VarG

(2,33)-(2,73)
b
VarG

(2,33)-(2,73)
a b
AppG (fromList [VarG])

(2,44)-(2,45)
fun i -> i
LamG VarG

(2,49)-(2,73)
i
VarG

*)
