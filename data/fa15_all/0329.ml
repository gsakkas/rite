
let pipe fs = let f a x = a x in let base p = p in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x p_pre = x (a p_pre) in let base p = p in List.fold_left f base fs;;

*)

(* changed spans
(2,26)-(2,29)
fun p_pre -> x (a p_pre)
LamG (AppG (fromList [EmptyG]))

(2,33)-(2,75)
a
VarG

(2,33)-(2,75)
p_pre
VarG

(2,33)-(2,75)
a p_pre
AppG (fromList [VarG])

*)
