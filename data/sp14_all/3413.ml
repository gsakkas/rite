
let pipe fs = let f a x = x fs in let base = fs in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = x in let base q = q in List.fold_left f base fs;;

*)

(* changed spans
(2,45)-(2,47)
fun q -> q
LamG VarG

(2,51)-(2,75)
q
VarG

*)
