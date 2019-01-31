
let pipe fs = let f a x = a :: x in let base = [] in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x b = x b in let base b = b in List.fold_left f base fs;;

*)

(* changed spans
(2,26)-(2,27)
fun b -> x b
LamG (AppG (fromList [EmptyG]))

(2,31)-(2,32)
x b
AppG (fromList [VarG])

(2,36)-(2,77)
b
VarG

(2,47)-(2,49)
fun b -> b
LamG VarG

(2,53)-(2,77)
b
VarG

*)
