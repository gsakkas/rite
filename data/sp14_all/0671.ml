
let pipe fs = let f a x x = x x in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x x a = x a in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(2,28)-(2,31)
fun a -> x a
LamG (AppG (fromList [EmptyG]))

(2,30)-(2,31)
a
VarG

*)
