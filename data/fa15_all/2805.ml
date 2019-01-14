
let pipe fs = let f a x x = a in let base f = f in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x x a = a in let base f = f in List.fold_left f base fs;;

*)

(* changed spans
(2,28)-(2,29)
fun a -> a
LamG VarG

*)
