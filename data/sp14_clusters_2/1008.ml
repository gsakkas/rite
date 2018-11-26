
let pipe fs = let f a x d = a in let base d = d in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = x in let base d = d in List.fold_left f base fs;;

*)

(* changed spans
(2,28)-(2,29)
x
VarG

*)
