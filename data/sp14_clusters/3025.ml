
let pipe fs = let f a x _ = x a in let base = [] in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x x = x in let base y = y in List.fold_left f base fs;;

*)

(* changed spans
(2,28)-(2,31)
fun x -> x
LamG VarG

(2,46)-(2,48)
fun y -> y
LamG VarG

(2,52)-(2,76)
y
VarG

*)
