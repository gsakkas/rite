
let pipe fs =
  let f a x b c = a x in let base y = y in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x y = a (x y) in let base b = b in List.fold_left f base fs;;

*)

(* changed spans
(3,14)-(3,21)
fun y -> a (x y)
LamG (AppG (fromList [EmptyG]))

(3,20)-(3,21)
x y
AppG (fromList [VarG])

(3,43)-(3,67)
b
VarG

(3,43)-(3,67)
fun b -> b
LamG VarG

(3,43)-(3,67)
let base = fun b -> b in
List.fold_left f base fs
LetG NonRec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

*)
