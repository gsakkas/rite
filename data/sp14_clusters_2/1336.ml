
let pipe fs = let f a x = a + x in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x y = y in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(2,30)-(2,31)
fun y -> y
LamG VarG

(2,35)-(2,77)
y
VarG

*)
