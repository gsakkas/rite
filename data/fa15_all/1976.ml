
let pipe fs = let f a x = a :: x in let base = [] in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x b = x b in let base b = b in List.fold_left f base fs;;

*)

(* changed spans
(2,27)-(2,33)
fun b -> x b
LamG VarPatG (AppG (fromList [EmptyG]))

(2,48)-(2,50)
fun b -> b
LamG VarPatG VarG

*)

(* type error slice
(2,15)-(2,78)
(2,21)-(2,33)
(2,23)-(2,33)
(2,27)-(2,28)
(2,27)-(2,33)
(2,54)-(2,68)
(2,54)-(2,78)
(2,69)-(2,70)
*)
