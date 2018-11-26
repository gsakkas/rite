
let pipe fs =
  let f a x y = y a x in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x x = a x in let base y = y in List.fold_left f base fs;;

*)

(* changed spans
(3,16)-(3,17)
fun x -> a x
LamG (AppG (fromList [EmptyG]))

(3,18)-(3,19)
a x
AppG (fromList [VarG])

(3,38)-(3,39)
fun y -> y
LamG VarG

(3,43)-(3,67)
y
VarG

*)
