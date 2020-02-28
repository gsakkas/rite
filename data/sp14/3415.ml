
let pipe fs = let f a x = x a in let base = fs fs in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = x in let base q = q in List.fold_left f base fs;;

*)

(* changed spans
(2,27)-(2,30)
x
VarG

(2,45)-(2,50)
fun q -> q
LamG VarPatG VarG

*)

(* type error slice
(2,45)-(2,47)
(2,45)-(2,50)
(2,48)-(2,50)
*)
