
let pipe fs = let f a x = a + x in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x y = y in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(2,27)-(2,32)
fun y -> y
LamG VarPatG VarG

*)

(* type error slice
(2,15)-(2,78)
(2,21)-(2,32)
(2,27)-(2,28)
(2,27)-(2,32)
(2,36)-(2,78)
(2,45)-(2,50)
(2,54)-(2,68)
(2,54)-(2,78)
(2,69)-(2,70)
(2,71)-(2,75)
*)
