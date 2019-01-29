
let pipe fs = let f a x = 0 in let base = fs in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = x in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(2,26)-(2,27)
x
VarG

(2,42)-(2,44)
fun x -> x
LamG VarG

(2,48)-(2,72)
x
VarG

*)
