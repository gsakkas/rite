
let pipe fs = let f a x = a x in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x y = a (x y) in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(2,26)-(2,29)
fun y -> a (x y)
LamG (AppG [EmptyG])

(2,28)-(2,29)
x y
AppG [VarG]

(2,33)-(2,75)
y
VarG

*)
