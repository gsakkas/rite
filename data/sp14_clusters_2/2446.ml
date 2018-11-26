
let pipe fs = let f a x = x a in let base = fs 3 in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x p = x (a p) in let base b = b in List.fold_left f base fs;;

*)

(* changed spans
(2,26)-(2,29)
fun p -> x (a p)
LamG (AppG (fromList [EmptyG]))

(2,28)-(2,29)
a p
AppG (fromList [VarG])

(2,33)-(2,76)
p
VarG

(2,47)-(2,48)
fun b -> b
LamG VarG

(2,52)-(2,76)
b
VarG

*)
