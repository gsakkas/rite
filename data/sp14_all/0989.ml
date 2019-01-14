
let pipe fs =
  let f a x = List.map x in let base = 3 in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x x = x in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,14)-(3,22)
fun x -> x
LamG VarG

(3,39)-(3,40)
fun x -> x
LamG VarG

(3,44)-(3,68)
x
VarG

*)
