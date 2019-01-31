
let pipe fs =
  let f a x = List.fold_right a 0 x in
  let base = 0 in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x g = x (a g) in let base k = k in List.fold_left f base fs;;

*)

(* changed spans
(3,32)-(3,33)
fun g -> x (a g)
LamG (AppG (fromList [EmptyG]))

(3,34)-(3,35)
x (a g)
AppG (fromList [AppG (fromList [EmptyG])])

(4,2)-(4,42)
a
VarG

(4,2)-(4,42)
g
VarG

(4,2)-(4,42)
a g
AppG (fromList [VarG])

(4,13)-(4,14)
fun k -> k
LamG VarG

(4,18)-(4,42)
k
VarG

*)
