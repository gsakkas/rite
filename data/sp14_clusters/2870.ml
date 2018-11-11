
let pipe fs = let f a x = a x in let base = f in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x p = x (a p) in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(2,26)-(2,29)
fun p -> x (a p)
LamG (AppG [EmptyG])

(2,33)-(2,73)
a
VarG

(2,33)-(2,73)
p
VarG

(2,33)-(2,73)
a p
AppG [VarG]

(2,44)-(2,45)
fun x -> x
LamG VarG

(2,49)-(2,73)
x
VarG

*)
