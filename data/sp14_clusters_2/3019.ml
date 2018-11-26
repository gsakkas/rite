
let pipe fs =
  let f a x = (+) (x a) in let base = 0 in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x a = a in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,19)-(3,20)
fun a -> a
LamG VarG

(3,38)-(3,39)
fun x -> x
LamG VarG

(3,43)-(3,67)
x
VarG

*)
