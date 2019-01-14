
let pipe fs =
  let f a x = (a, x) in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x y = x (a y) in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,15)-(3,16)
fun y -> x (a y)
LamG (AppG (fromList [EmptyG]))

(3,18)-(3,19)
x (a y)
AppG (fromList [AppG (fromList [EmptyG])])

(3,24)-(3,66)
a
VarG

(3,24)-(3,66)
y
VarG

(3,24)-(3,66)
a y
AppG (fromList [VarG])

*)
