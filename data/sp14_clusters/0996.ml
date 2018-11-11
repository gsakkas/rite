
let pipe fs = let f a x = x a in let base = fs in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x x a = a in let base p = p in List.fold_left f base fs;;

*)

(* changed spans
(2,26)-(2,27)
fun x -> fun a -> a
LamG (LamG EmptyG)

(2,28)-(2,29)
fun a -> a
LamG VarG

(2,44)-(2,46)
fun p -> p
LamG VarG

(2,50)-(2,74)
p
VarG

*)
