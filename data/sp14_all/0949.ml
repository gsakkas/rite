
let pipe fs = let f a x a = x in let base = 0 in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x c = x (a c) in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(2,25)-(2,30)
fun c -> x (a c)
LamG VarPatG (AppG [EmptyG])

(2,45)-(2,46)
fun x -> x
LamG VarPatG VarG

*)

(* type error slice
(2,15)-(2,74)
(2,21)-(2,30)
(2,23)-(2,30)
(2,25)-(2,30)
(2,34)-(2,74)
(2,45)-(2,46)
(2,50)-(2,64)
(2,50)-(2,74)
(2,65)-(2,66)
(2,67)-(2,71)
*)
