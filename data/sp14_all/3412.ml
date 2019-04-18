
let pipe fs = let f a x = x fs in let base = 0 in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = x in let base q = q in List.fold_left f base fs;;

*)

(* changed spans
(2,27)-(2,31)
x
VarG

(2,46)-(2,47)
fun q -> q
LamG VarPatG VarG

*)

(* type error slice
(2,15)-(2,75)
(2,21)-(2,31)
(2,23)-(2,31)
(2,27)-(2,28)
(2,27)-(2,31)
(2,29)-(2,31)
(2,51)-(2,65)
(2,51)-(2,75)
(2,66)-(2,67)
(2,73)-(2,75)
*)
