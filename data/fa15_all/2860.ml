
let pipe fs = let f a x = fs in let base = 0 in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = x in let base y = y in List.fold_left f base fs;;

*)

(* changed spans
(2,26)-(2,28)
x
VarG

(2,43)-(2,44)
fun y -> y
LamG VarG

(2,48)-(2,72)
y
VarG

*)
