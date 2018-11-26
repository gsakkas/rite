
let pipe fs =
  let f a x f x = f (x a) in let base z = z in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x z = x (a z) in let base z = z in List.fold_left f base fs;;

*)

(* changed spans
(3,18)-(3,19)
fun z -> x (a z)
LamG (AppG (fromList [EmptyG]))

(3,23)-(3,24)
a z
AppG (fromList [VarG])

(3,29)-(3,71)
z
VarG

*)
