
let pipe fs = let f a x a x = a x in let base = 0 in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x a x = a x in let base y = y in List.fold_left f base fs;;

*)

(* changed spans
(2,48)-(2,49)
fun y -> y
LamG VarG

(2,53)-(2,77)
y
VarG

*)
