
let pipe fs = let f a x x a = x in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x a = a in let base f = f in List.fold_left f base fs;;

*)

(* changed spans
(2,30)-(2,31)
a
VarG

(2,48)-(2,49)
fun f -> f
LamG VarG

(2,53)-(2,77)
f
VarG

*)
