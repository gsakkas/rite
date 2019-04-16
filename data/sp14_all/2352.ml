
let pipe fs = let f a x = a x in let base a = f a in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x z = a (x z) in let base a = a in List.fold_left f base fs;;

*)

(* changed spans
(2,27)-(2,30)
fun z -> a (x z)
LamG VarPatG (AppG (fromList [EmptyG]))

(2,47)-(2,50)
a
VarG

*)

(* type error slice
(2,15)-(2,78)
(2,21)-(2,30)
(2,23)-(2,30)
(2,27)-(2,28)
(2,27)-(2,30)
(2,54)-(2,68)
(2,54)-(2,78)
(2,69)-(2,70)
*)
