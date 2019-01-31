
let pipe fs =
  let f a x = let h::t = x in h a t in
  let base = [] in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x g = x (a g) in let base k = k in List.fold_left f base fs;;

*)

(* changed spans
(3,14)-(3,35)
fun g -> x (a g)
LamG (AppG (fromList [EmptyG]))

(3,25)-(3,26)
x (a g)
AppG (fromList [AppG (fromList [EmptyG])])

(3,30)-(3,31)
a g
AppG (fromList [VarG])

(3,34)-(3,35)
g
VarG

(4,13)-(4,15)
fun k -> k
LamG VarG

(4,19)-(4,43)
k
VarG

*)
