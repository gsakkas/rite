
let pipe fs = let f a x = x @ a in let base = 0 in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x b = x b in let base b = b in List.fold_left f base fs;;

*)

(* changed spans
(2,27)-(2,32)
fun b -> x b
LamG VarPatG (AppG [EmptyG])

(2,47)-(2,48)
fun b -> b
LamG VarPatG VarG

*)

(* type error slice
(2,15)-(2,76)
(2,21)-(2,32)
(2,27)-(2,32)
(2,29)-(2,30)
(2,31)-(2,32)
(2,36)-(2,76)
(2,47)-(2,48)
(2,52)-(2,66)
(2,52)-(2,76)
(2,67)-(2,68)
(2,69)-(2,73)
*)
