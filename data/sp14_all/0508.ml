
let pipe fs = let f a x = x a in let base = fs in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x q = x (a q) in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(2,26)-(2,29)
fun q -> x (a q)
LamG (AppG (fromList [EmptyG]))

(2,28)-(2,29)
a q
AppG (fromList [VarG])

(2,33)-(2,74)
q
VarG

(2,44)-(2,46)
fun x -> x
LamG VarG

(2,50)-(2,74)
x
VarG

*)
