
let pipe fs =
  let f a x y = x (a y) in let base = fs in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x y = x (a y) in let base fs = fs in List.fold_left f base fs;;

*)

(* changed spans
(3,38)-(3,40)
fun fs -> fs
LamG VarG

*)
