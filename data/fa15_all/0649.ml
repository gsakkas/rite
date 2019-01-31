
let pipe fs =
  let f a x g = x (a g) in let base = [] in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x g = x (a g) in let base k = k in List.fold_left f base fs;;

*)

(* changed spans
(3,38)-(3,40)
fun k -> k
LamG VarG

(3,44)-(3,68)
k
VarG

*)
