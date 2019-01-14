
let pipe fs = let f a x a = a x in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x x = a x in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(2,24)-(2,31)
fun x -> a x
LamG (AppG (fromList [EmptyG]))

*)
