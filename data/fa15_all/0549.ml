
let pipe fs = let f a x = a x in let base fs = fs in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x x a = x a in let base fs = fs in List.fold_left f base fs;;

*)

(* changed spans
(2,26)-(2,29)
fun x -> fun a -> x a
LamG (LamG EmptyG)

(2,26)-(2,29)
fun a -> x a
LamG (AppG (fromList [EmptyG]))

(2,33)-(2,77)
a
VarG

*)
