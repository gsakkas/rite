
let pipe fs =
  let f a x r s = a in let base r s = 0 in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x x = x in let base y = y in List.fold_left f base fs;;

*)

(* changed spans
(3,18)-(3,19)
fun x -> x
LamG VarG

(3,23)-(3,67)
x
VarG

(3,38)-(3,39)
fun y -> y
LamG VarG

(3,43)-(3,67)
y
VarG

*)
