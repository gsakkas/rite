
let pipe fs =
  let f a x = let h::t = x in (h a) t in
  let base = [] in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x g = x (a g) in let base k = k in List.fold_left f base fs;;

*)

(* changed spans
(3,25)-(3,26)
fun g -> x (a g)
LamG (AppG (fromList [EmptyG]))

(3,30)-(3,35)
x
VarG

(3,36)-(3,37)
g
VarG

(4,13)-(4,15)
fun k -> k
LamG VarG

(4,19)-(4,43)
k
VarG

*)
