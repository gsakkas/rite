
let pipe fs = let f a x = a a x in let base = 0 in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = a in let base f = 0 in List.fold_left f base fs;;

*)

(* changed spans
(2,27)-(2,32)
a
VarG

(2,47)-(2,48)
fun f -> 0
LamG VarPatG LitG

*)

(* type error slice
(2,27)-(2,28)
(2,27)-(2,32)
(2,29)-(2,30)
*)
