
let pipe fs = let f a x = a x in let base g p = p in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x q = x q in let base z = z in List.fold_left f base fs;;

*)

(* changed spans
(2,26)-(2,29)
fun q -> x q
LamG (AppG (fromList [EmptyG]))

(2,33)-(2,77)
q
VarG

(2,48)-(2,49)
fun z -> z
LamG VarG

(2,53)-(2,77)
z
VarG

*)
