
let pipe fs = let f a x = a x in let base y = y in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x z = x (a z) in let base y = y in List.fold_left f base fs;;

*)

(* changed spans
(2,26)-(2,29)
fun z -> x (a z)
LamG (AppG (fromList [EmptyG]))

(2,33)-(2,75)
a
VarG

(2,33)-(2,75)
z
VarG

(2,33)-(2,75)
a z
AppG (fromList [VarG])

*)
