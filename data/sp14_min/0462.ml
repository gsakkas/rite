
let pipe fs = let f a x = fs a in let base = 0 in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x y = x (a y) in let base y = y in List.fold_left f base fs;;

*)

(* changed spans
(2,27)-(2,31)
fun y -> x (a y)
LamG VarPatG (AppG [EmptyG])

(2,46)-(2,47)
fun y -> y
LamG VarPatG VarG

*)

(* type error slice
(2,27)-(2,29)
(2,27)-(2,31)
(2,51)-(2,65)
(2,51)-(2,75)
(2,73)-(2,75)
*)
