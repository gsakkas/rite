
let pipe fs =
  let f a x x a = x x a in let base f x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x f' = x (a f') in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,18)-(3,19)
fun f' -> x (a f')
LamG (AppG (fromList [EmptyG]))

(3,20)-(3,21)
x (a f')
AppG (fromList [AppG (fromList [EmptyG])])

(3,22)-(3,23)
a f'
AppG (fromList [VarG])

(3,27)-(3,71)
f'
VarG

*)
