
let pipe fs = let f a x = [fs a] in let base = 0 in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x y = x (a y) in let base y = y in List.fold_left f base fs;;

*)

(* changed spans
(2,27)-(2,33)
fun y -> x (a y)
LamG VarPatG (AppG [EmptyG])

(2,48)-(2,49)
fun y -> y
LamG VarPatG VarG

*)

(* type error slice
(2,15)-(2,77)
(2,21)-(2,33)
(2,23)-(2,33)
(2,27)-(2,33)
(2,37)-(2,77)
(2,48)-(2,49)
(2,53)-(2,67)
(2,53)-(2,77)
(2,68)-(2,69)
(2,70)-(2,74)
*)
