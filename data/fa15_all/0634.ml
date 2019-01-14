
let pipe fs =
  let f a x = List.fold_right a x in let base = 0 in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x g = x (a g) in let base k = k in List.fold_left f base fs;;

*)

(* changed spans
(3,30)-(3,31)
fun g -> x (a g)
LamG (AppG (fromList [EmptyG]))

(3,32)-(3,33)
x (a g)
AppG (fromList [AppG (fromList [EmptyG])])

(3,37)-(3,77)
a
VarG

(3,37)-(3,77)
g
VarG

(3,37)-(3,77)
a g
AppG (fromList [VarG])

(3,48)-(3,49)
fun k -> k
LamG VarG

(3,53)-(3,77)
k
VarG

*)
