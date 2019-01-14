
let pipe fs = let f a x = a + x in let base = [] in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x b = x b in let base b = b in List.fold_left f base fs;;

*)

(* changed spans
(2,26)-(2,27)
fun b -> x b
LamG (AppG (fromList [EmptyG]))

(2,30)-(2,31)
x b
AppG (fromList [VarG])

(2,35)-(2,76)
b
VarG

(2,46)-(2,48)
fun b -> b
LamG VarG

(2,52)-(2,76)
b
VarG

*)
