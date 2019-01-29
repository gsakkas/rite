
let pipe fs = let f a x = a x in let base a = f a in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x z = a (x z) in let base a = a in List.fold_left f base fs;;

*)

(* changed spans
(2,26)-(2,29)
fun z -> a (x z)
LamG (AppG (fromList [EmptyG]))

(2,28)-(2,29)
x z
AppG (fromList [VarG])

(2,33)-(2,77)
z
VarG

*)
