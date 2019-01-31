
let pipe fs = let f a x x = x a in let base y = y in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x z = x (a z) in let base y = y in List.fold_left f base fs;;

*)

(* changed spans
(2,24)-(2,31)
fun z -> x (a z)
LamG (AppG (fromList [EmptyG]))

(2,30)-(2,31)
a z
AppG (fromList [VarG])

(2,35)-(2,77)
z
VarG

*)
