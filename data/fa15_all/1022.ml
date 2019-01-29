
let pipe fs = let f a x = a x in let base a' = a' in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = a in let base p = p in List.fold_left f base fs;;

*)

(* changed spans
(2,47)-(2,49)
fun p -> p
LamG VarG

(2,53)-(2,77)
p
VarG

*)
