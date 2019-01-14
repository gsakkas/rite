
let pipe fs = let f a x a = a x in let base y = y in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x = let c y = x (a y) in c in
  let base = let g y = y in g in List.fold_left f base fs;;

*)

(* changed spans
(2,24)-(2,31)
let c = fun y -> x (a y) in c
LetG NonRec (fromList [LamG EmptyG]) VarG

(2,28)-(2,31)
fun y -> x (a y)
LamG (AppG (fromList [EmptyG]))

(2,35)-(2,77)
a
VarG

(2,35)-(2,77)
y
VarG

(2,35)-(2,77)
c
VarG

(2,35)-(2,77)
a y
AppG (fromList [VarG])

(2,44)-(2,49)
let g = fun y -> y in g
LetG NonRec (fromList [LamG EmptyG]) VarG

(2,53)-(2,77)
g
VarG

*)
