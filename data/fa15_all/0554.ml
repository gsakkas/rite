
let pipe fs =
  let f a x a = x a in let base a = fs in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x a = x a in let base fs = fs in List.fold_left f base fs;;

*)

(* changed spans
(3,32)-(3,38)
fun fs -> fs
LamG VarG

*)
