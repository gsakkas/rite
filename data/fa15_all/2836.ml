
let pipe fs = let f a x x = x a in let base = fs in List.fold_left f base fs;;


(* fix

let f a x x a = a x;;

let pipe fs =
  let f a x g = f a x in let base f = f in List.fold_left f base fs;;

*)

(* changed spans
(2,25)-(2,32)
fun g -> f a x
LamG VarPatG (AppG (fromList [EmptyG]))

(2,47)-(2,49)
fun f -> f
LamG VarPatG VarG

*)

(* type error slice
(2,15)-(2,77)
(2,21)-(2,32)
(2,23)-(2,32)
(2,25)-(2,32)
(2,29)-(2,30)
(2,29)-(2,32)
(2,31)-(2,32)
(2,53)-(2,67)
(2,53)-(2,77)
(2,68)-(2,69)
*)
