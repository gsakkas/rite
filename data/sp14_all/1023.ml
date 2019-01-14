
let pipe fs =
  let f a x p' = a in let base a' = a' in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = a in let base p = p in List.fold_left f base fs;;

*)

(* changed spans
(3,36)-(3,38)
fun p -> p
LamG VarG

(3,42)-(3,66)
p
VarG

*)
