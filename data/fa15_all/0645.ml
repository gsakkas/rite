
let pipe fs =
  let f a x = List.fold_right a [] x in
  let base = 0 in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x g = x (a g) in let base k = k in List.fold_left f base fs;;

*)

(* changed spans
(3,15)-(3,37)
fun g -> x (a g)
LamG VarPatG (AppG (fromList [EmptyG]))

(4,14)-(4,15)
fun k -> k
LamG VarPatG VarG

*)

(* type error slice
(3,3)-(4,43)
(3,9)-(3,37)
(3,11)-(3,37)
(3,15)-(3,30)
(3,15)-(3,37)
(3,31)-(3,32)
(4,19)-(4,33)
(4,19)-(4,43)
(4,34)-(4,35)
*)
