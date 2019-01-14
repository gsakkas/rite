
let pipe fs = let f a x a = x in let base = [] in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x c = x (a c) in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(2,24)-(2,29)
fun c -> x (a c)
LamG (AppG (fromList [EmptyG]))

(2,28)-(2,29)
x (a c)
AppG (fromList [AppG (fromList [EmptyG])])

(2,33)-(2,74)
a
VarG

(2,33)-(2,74)
c
VarG

(2,33)-(2,74)
a c
AppG (fromList [VarG])

(2,44)-(2,46)
fun x -> x
LamG VarG

(2,50)-(2,74)
x
VarG

*)
