
let pipe fs =
  let f a x = a = (x a) in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x y = x (a y) in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,14)-(3,15)
fun y -> x (a y)
LamG (AppG (fromList [EmptyG]))

(3,21)-(3,22)
a y
AppG (fromList [VarG])

(3,27)-(3,69)
y
VarG

*)
