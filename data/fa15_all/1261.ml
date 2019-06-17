
let pipe fs = let f a x = a x in let base = 0 in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x b = x (a b) in let base i = i in List.fold_left f base fs;;

*)

(* changed spans
(2,27)-(2,30)
fun b -> x (a b)
LamG VarPatG (AppG [EmptyG])

(2,45)-(2,46)
fun i -> i
LamG VarPatG VarG

*)

(* type error slice
(2,15)-(2,74)
(2,21)-(2,30)
(2,23)-(2,30)
(2,27)-(2,28)
(2,27)-(2,30)
(2,50)-(2,64)
(2,50)-(2,74)
(2,65)-(2,66)
*)
