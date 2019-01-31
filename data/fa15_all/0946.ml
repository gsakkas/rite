
let pipe fs = let f a x x = x a in let base z = z in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x q = x q in let base z = z in List.fold_left f base fs;;

*)

(* changed spans
(2,24)-(2,31)
fun q -> x q
LamG (AppG (fromList [EmptyG]))

(2,30)-(2,31)
q
VarG

*)
