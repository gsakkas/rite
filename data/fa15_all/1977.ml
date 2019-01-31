
let pipe fs = let f a x = a x in let base = [] in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x b = x b in let base b = b in List.fold_left f base fs;;

*)

(* changed spans
(2,26)-(2,29)
fun b -> x b
LamG (AppG (fromList [EmptyG]))

(2,33)-(2,74)
b
VarG

(2,44)-(2,46)
fun b -> b
LamG VarG

(2,50)-(2,74)
b
VarG

*)
