
let pipe fs = let f a x x = x a in let base b = b in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x c = x c in let base b = b in List.fold_left f base fs;;

*)

(* changed spans
(2,24)-(2,31)
fun c -> x c
LamG (AppG (fromList [EmptyG]))

(2,30)-(2,31)
c
VarG

*)
