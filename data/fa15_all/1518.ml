
let pipe fs =
  let f a x a x = x a in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x y = x (a y) in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,14)-(3,21)
fun y -> x (a y)
LamG (AppG (fromList [EmptyG]))

(3,20)-(3,21)
a y
AppG (fromList [VarG])

(3,25)-(3,67)
y
VarG

*)
