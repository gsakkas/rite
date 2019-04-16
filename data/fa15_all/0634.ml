
let pipe fs =
  let f a x = List.fold_right a x in let base = 0 in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x g = x (a g) in let base k = k in List.fold_left f base fs;;

*)

(* changed spans
(3,15)-(3,34)
fun g -> x (a g)
LamG VarPatG (AppG (fromList [EmptyG]))

(3,49)-(3,50)
fun k -> k
LamG VarPatG VarG

*)

(* type error slice
(3,3)-(3,78)
(3,9)-(3,34)
(3,11)-(3,34)
(3,15)-(3,30)
(3,15)-(3,34)
(3,31)-(3,32)
(3,54)-(3,68)
(3,54)-(3,78)
(3,69)-(3,70)
*)
