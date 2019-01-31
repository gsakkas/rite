
let pipe fs n = let f a x = a n in let base = n in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = a in let base fs = fs in List.fold_left f base fs;;

*)

(* changed spans
(2,46)-(2,47)
fun fs -> fs
LamG VarG

(2,51)-(2,75)
fs
VarG

*)
