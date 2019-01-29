
let pipe fs = let f a x = a x in let base p = p in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x x a = a in let base p = p in List.fold_left f base fs;;

*)

(* changed spans
(2,26)-(2,27)
fun a -> a
LamG VarG

(2,26)-(2,29)
fun x -> fun a -> a
LamG (LamG EmptyG)

*)
