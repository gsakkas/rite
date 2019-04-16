
let pipe fs = let f a x a = x x in let base f = f in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x a x = x in let base f = f in List.fold_left f base fs;;

*)

(* changed spans
(2,29)-(2,32)
fun x -> x
LamG VarPatG VarG

*)

(* type error slice
(2,29)-(2,30)
(2,29)-(2,32)
(2,31)-(2,32)
*)
