
let pipe fs = let f a x = a x in let base = [] in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x a = a in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(2,26)-(2,29)
fun a -> a
LamG VarG

(2,44)-(2,46)
fun x -> x
LamG VarG

(2,50)-(2,74)
x
VarG

*)
