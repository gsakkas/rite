
let pipe fs =
  let f a x f x = f a in let base y = y in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x f x f a = f a x in let base y = y in List.fold_left f base fs;;

*)

(* changed spans
(3,18)-(3,19)
fun a -> f a x
LamG (AppG (fromList [EmptyG]))

(3,18)-(3,19)
f a x
AppG (fromList [VarG])

(3,18)-(3,21)
fun f -> fun a -> f a x
LamG (LamG EmptyG)

(3,25)-(3,67)
x
VarG

*)
