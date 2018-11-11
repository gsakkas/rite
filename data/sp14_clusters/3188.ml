
let pipe fs = let f a x = x x in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x y = x (a y) in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(2,26)-(2,29)
fun y -> x (a y)
LamG (AppG [EmptyG])

(2,28)-(2,29)
a y
AppG [VarG]

(2,33)-(2,75)
a
VarG

(2,33)-(2,75)
y
VarG

*)
