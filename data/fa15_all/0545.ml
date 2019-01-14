
let pipe fs n =
  let f a x = a + (n x) in let base = n in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = a in let base fs = fs in List.fold_left f base fs;;

*)

(* changed spans
(3,38)-(3,39)
fun fs -> fs
LamG VarG

(3,43)-(3,67)
fs
VarG

*)
