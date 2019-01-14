
let pipe fs = let f a x = fs in let base = 0 in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = a in let base fs = fs in List.fold_left f base fs;;

*)

(* changed spans
(2,26)-(2,28)
a
VarG

(2,43)-(2,44)
fun fs -> fs
LamG VarG

(2,48)-(2,72)
fs
VarG

*)
