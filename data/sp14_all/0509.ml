
let pipe fs = let f a x = a x in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x q = x (a q) in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(2,26)-(2,29)
fun q -> x (a q)
LamG (AppG (fromList [EmptyG]))

(2,33)-(2,75)
a
VarG

(2,33)-(2,75)
q
VarG

(2,33)-(2,75)
a q
AppG (fromList [VarG])

*)
