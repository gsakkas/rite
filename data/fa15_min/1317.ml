
let pipe fs = let f a x x a = x a in let base = 0 in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = a in let base f = 0 in List.fold_left f base fs;;

*)

(* changed spans
(2,25)-(2,34)
a
VarG

(2,49)-(2,50)
fun f -> 0
LamG VarPatG LitG

*)

(* type error slice
(2,15)-(2,78)
(2,21)-(2,34)
(2,23)-(2,34)
(2,25)-(2,34)
(2,38)-(2,78)
(2,49)-(2,50)
(2,54)-(2,68)
(2,54)-(2,78)
(2,69)-(2,70)
(2,71)-(2,75)
*)
