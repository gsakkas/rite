
let pipe fs = let f a x = a x in let base = [] in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x i = x (a i) in let base y = y in List.fold_left f base fs;;

*)

(* changed spans
(2,26)-(2,29)
fun i -> x (a i)
LamG (AppG (fromList [EmptyG]))

(2,33)-(2,74)
a
VarG

(2,33)-(2,74)
i
VarG

(2,33)-(2,74)
a i
AppG (fromList [VarG])

(2,44)-(2,46)
fun y -> y
LamG VarG

(2,50)-(2,74)
y
VarG

*)
