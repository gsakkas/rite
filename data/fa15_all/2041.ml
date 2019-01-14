
let pipe fs =
  let f a x m n = m a in let base n = n in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x x a = x a in let base n = n in List.fold_left f base fs;;

*)

(* changed spans
(3,14)-(3,21)
fun x -> fun a -> x a
LamG (LamG EmptyG)

(3,18)-(3,19)
x
VarG

(3,18)-(3,21)
fun a -> x a
LamG (AppG (fromList [EmptyG]))

*)
