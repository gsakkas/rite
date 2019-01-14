
let pipe fs =
  let f a x x = x a in let base fs = fs in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x a = x a in let base a = a in List.fold_left f base fs;;

*)

(* changed spans
(3,12)-(3,19)
fun a -> x a
LamG (AppG (fromList [EmptyG]))

(3,37)-(3,39)
fun a -> a
LamG VarG

(3,43)-(3,67)
a
VarG

*)
