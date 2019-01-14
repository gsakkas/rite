
let pipe fs = let f a x x = x a in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x b = x (a b) in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(2,24)-(2,31)
fun b -> x (a b)
LamG (AppG (fromList [EmptyG]))

(2,30)-(2,31)
a b
AppG (fromList [VarG])

(2,35)-(2,77)
b
VarG

*)
