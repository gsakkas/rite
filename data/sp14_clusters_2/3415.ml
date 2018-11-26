
let pipe fs = let f a x = x a in let base = fs fs in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = x in let base q = q in List.fold_left f base fs;;

*)

(* changed spans
(2,47)-(2,49)
fun q -> q
LamG VarG

(2,53)-(2,77)
q
VarG

*)
