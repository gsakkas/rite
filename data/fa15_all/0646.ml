
let pipe fs =
  let f a x = List.fold_right a [] x in
  let base = [] in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x g = x (a g) in let base k = k in List.fold_left f base fs;;

*)

(* changed spans
(3,32)-(3,34)
fun g -> x (a g)
LamG (AppG (fromList [EmptyG]))

(3,35)-(3,36)
x (a g)
AppG (fromList [AppG (fromList [EmptyG])])

(4,2)-(4,43)
a
VarG

(4,2)-(4,43)
g
VarG

(4,2)-(4,43)
a g
AppG (fromList [VarG])

(4,13)-(4,15)
fun k -> k
LamG VarG

(4,19)-(4,43)
k
VarG

*)
