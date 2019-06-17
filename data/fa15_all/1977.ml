
let pipe fs = let f a x = a x in let base = [] in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x b = x b in let base b = b in List.fold_left f base fs;;

*)

(* changed spans
(2,27)-(2,30)
fun b -> x b
LamG VarPatG (AppG [EmptyG])

(2,45)-(2,47)
fun b -> b
LamG VarPatG VarG

*)

(* type error slice
(2,15)-(2,75)
(2,21)-(2,30)
(2,23)-(2,30)
(2,27)-(2,28)
(2,27)-(2,30)
(2,51)-(2,65)
(2,51)-(2,75)
(2,66)-(2,67)
*)
