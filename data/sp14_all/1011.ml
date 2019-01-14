
let pipe fs = let f a x a = a x in let base d = d in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x a = x a in let base d = d in List.fold_left f base fs;;

*)

(* changed spans
(2,35)-(2,77)
a
VarG

*)
