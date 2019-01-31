
let pipe fs = let f a x x = a in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x a = a in let base f = f in List.fold_left f base fs;;

*)

(* changed spans
(2,24)-(2,29)
fun a -> a
LamG VarG

(2,46)-(2,47)
fun f -> f
LamG VarG

(2,51)-(2,75)
f
VarG

*)
