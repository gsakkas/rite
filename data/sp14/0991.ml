
let a = 20;;

let f x = let y = 1 in let g z = y + z in a + (g x);;

let pipe fs = let f a x = f a x in let base = 3 in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x x = x in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(6,27)-(6,32)
fun x -> x
LamG VarPatG VarG

(6,47)-(6,48)
fun x -> x
LamG VarPatG VarG

*)

(* type error slice
(4,4)-(4,54)
(4,7)-(4,52)
(4,11)-(4,52)
(4,24)-(4,52)
(4,43)-(4,52)
(6,27)-(6,28)
(6,27)-(6,32)
*)
