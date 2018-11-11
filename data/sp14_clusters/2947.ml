
let pipe fs = let f a x = a x in let base y = y in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x y = a (x y) in let base b = b in List.fold_left f base fs;;

*)

(* changed spans
(2,26)-(2,29)
fun y -> a (x y)
LamG (AppG [EmptyG])

(2,28)-(2,29)
x y
AppG [VarG]

(2,51)-(2,75)
b
VarG

(2,51)-(2,75)
fun b -> b
LamG VarG

(2,51)-(2,75)
let base = fun b -> b in
List.fold_left f base fs
LetG NonRec [LamG EmptyG] (AppG [EmptyG,EmptyG,EmptyG])

*)
