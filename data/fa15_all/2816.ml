
let pipe fs = let f a x x = a in let base f = f in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x x = a x in let base f = f in List.fold_left f base fs;;

*)

(* changed spans
(2,28)-(2,29)
a x
AppG (fromList [VarG])

(2,33)-(2,75)
x
VarG

*)
