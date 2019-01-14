
let pipe fs = let f a x = a x in let base = f in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = x in let base f x = x in List.fold_left f base fs;;

*)

(* changed spans
(2,44)-(2,45)
fun f -> fun x -> x
LamG (LamG EmptyG)

(2,49)-(2,73)
x
VarG

(2,49)-(2,73)
fun x -> x
LamG VarG

*)
