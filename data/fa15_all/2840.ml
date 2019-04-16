
let pipe fs = let f a x = a x in let base f a = a in List.fold_left f base fs;;


(* fix

let f a x x a = a x;;

let pipe fs =
  let f a x g = f a x in let base f = f in List.fold_left f base fs;;

*)

(* changed spans
(2,27)-(2,30)
fun g -> f a x
LamG VarPatG (AppG (fromList [EmptyG]))

(2,45)-(2,50)
f
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
