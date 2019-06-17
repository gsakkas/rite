
let pipe fs = let f a x d = x a in let base = 0 in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x y = x (a y) in let base i = i in List.fold_left f base fs;;

*)

(* changed spans
(2,25)-(2,32)
fun y -> x (a y)
LamG VarPatG (AppG [EmptyG])

(2,47)-(2,48)
fun i -> i
LamG VarPatG VarG

*)

(* type error slice
(2,15)-(2,76)
(2,21)-(2,32)
(2,23)-(2,32)
(2,25)-(2,32)
(2,36)-(2,76)
(2,47)-(2,48)
(2,52)-(2,66)
(2,52)-(2,76)
(2,67)-(2,68)
(2,69)-(2,73)
*)
