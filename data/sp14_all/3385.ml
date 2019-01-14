
let pipe fs = let f a x = x a in let base = fs in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = x in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(2,44)-(2,46)
fun x -> x
LamG VarG

(2,50)-(2,74)
x
VarG

*)
