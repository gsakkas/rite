
let pipe fs = let f a x = a + x in let base = fs in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = x in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(2,46)-(2,48)
fun x -> x
LamG VarG

(2,52)-(2,76)
x
VarG

*)
