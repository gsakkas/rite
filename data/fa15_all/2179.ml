
let pipe fs = let f a x x = x a in let base y = y in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x y = x (a y) in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(2,24)-(2,31)
fun y -> x (a y)
LamG (AppG (fromList [EmptyG]))

(2,30)-(2,31)
a y
AppG (fromList [VarG])

(2,53)-(2,77)
x
VarG

(2,53)-(2,77)
fun x -> x
LamG VarG

(2,53)-(2,77)
let base = fun x -> x in
List.fold_left f base fs
LetG NonRec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

*)
