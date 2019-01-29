
let pipe fs = let f a x _ = a in let base y = y in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x x = x in let base y = y in List.fold_left f base fs;;

*)

(* changed spans
(2,28)-(2,29)
fun x -> x
LamG VarG

(2,33)-(2,75)
x
VarG

*)
