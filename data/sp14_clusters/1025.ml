
let pipe fs = let f a x x = x a in let base p = p in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x l = x (a l) in let base p = p in List.fold_left f base fs;;

*)

(* changed spans
(2,24)-(2,31)
fun l -> x (a l)
LamG (AppG [EmptyG])

(2,30)-(2,31)
a l
AppG [VarG]

(2,35)-(2,77)
l
VarG

*)