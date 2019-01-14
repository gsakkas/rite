
let pipe fs = let f a x = x a in let base = fs in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x a = x a in let base y = y in List.fold_left f base fs;;

*)

(* changed spans
(2,26)-(2,29)
fun a -> x a
LamG (AppG (fromList [EmptyG]))

(2,44)-(2,46)
fun y -> y
LamG VarG

(2,50)-(2,74)
y
VarG

*)
