
let pipe fs =
  let f a x a x = x a in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x x a = a in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,18)-(3,19)
fun a -> a
LamG VarG

*)
