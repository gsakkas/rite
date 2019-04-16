
let x _ f = f;;

let pipe fs = let f a x = a x in let base = x in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = x in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(4,27)-(4,30)
x
VarG

(4,45)-(4,46)
fun x -> x
LamG VarPatG VarG

*)

(* type error slice
(4,15)-(4,74)
(4,21)-(4,30)
(4,23)-(4,30)
(4,27)-(4,28)
(4,27)-(4,30)
(4,50)-(4,64)
(4,50)-(4,74)
(4,65)-(4,66)
*)
