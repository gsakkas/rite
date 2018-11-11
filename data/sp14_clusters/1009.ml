
let pipe fs = let f a x = a x in let base d = d in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x a = x a in let base d = d in List.fold_left f base fs;;

*)

(* changed spans
(2,26)-(2,29)
fun a -> x a
LamG (AppG [EmptyG])

(2,33)-(2,75)
a
VarG

*)
