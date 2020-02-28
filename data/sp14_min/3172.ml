
let pipe fs = let f a x = 0 in let base = fs in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = x in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(2,27)-(2,28)
x
VarG

(2,43)-(2,45)
fun x -> x
LamG VarPatG VarG

*)

(* type error slice
(2,15)-(2,73)
(2,21)-(2,28)
(2,23)-(2,28)
(2,27)-(2,28)
(2,32)-(2,73)
(2,43)-(2,45)
(2,49)-(2,63)
(2,49)-(2,73)
(2,64)-(2,65)
(2,66)-(2,70)
(2,71)-(2,73)
*)
