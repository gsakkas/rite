
let pipe fs = let f a x = a x in let base g x = x in List.fold_left f base fs;;


(* fix

let y x = x + 1;;

let q x = y x;;

let pipe fs =
  let f a x el = x (a q) in let base g q = q in List.fold_left f base fs;;

*)

(* changed spans
(2,9)-(2,77)
x
VarG

(2,9)-(2,77)
y
VarG

(2,9)-(2,77)
x
VarG

(2,9)-(2,77)
fun x -> x + 1
LamG (BopG EmptyG EmptyG)

(2,9)-(2,77)
fun x -> y x
LamG (AppG (fromList [EmptyG]))

(2,9)-(2,77)
y x
AppG (fromList [VarG])

(2,9)-(2,77)
x + 1
BopG VarG LitG

(2,9)-(2,77)
1
LitG

(2,26)-(2,29)
fun el -> x (a q)
LamG (AppG (fromList [EmptyG]))

(2,33)-(2,77)
a
VarG

(2,33)-(2,77)
q
VarG

(2,33)-(2,77)
a q
AppG (fromList [VarG])

(2,48)-(2,49)
fun q -> q
LamG VarG

(2,53)-(2,77)
q
VarG

*)
