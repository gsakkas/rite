
let pipe fs =
  let f a x = a (x a) in let base y = y in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x z = x (a z) in let base y = y in List.fold_left f base fs;;

*)

(* changed spans
(3,14)-(3,15)
fun z -> x (a z)
LamG (AppG (fromList [EmptyG]))

(3,19)-(3,20)
a z
AppG (fromList [VarG])

(3,25)-(3,67)
z
VarG

*)
