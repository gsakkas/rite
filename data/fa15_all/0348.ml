
let pipe fs = let f a x = a x in let base n = n in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x n = x n in let base n = n in List.fold_left f base fs;;

*)

(* changed spans
(2,26)-(2,29)
fun n -> x n
LamG (AppG (fromList [EmptyG]))

(2,33)-(2,75)
n
VarG

*)
