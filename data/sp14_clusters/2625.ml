
let pipe fs =
  let f a x = x a in let base = List.hd fs in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x y = x (a y) in let base z = z in List.fold_left f base fs;;

*)

(* changed spans
(3,14)-(3,17)
fun y -> x (a y)
LamG (AppG [EmptyG])

(3,16)-(3,17)
a y
AppG [VarG]

(3,21)-(3,70)
y
VarG

(3,40)-(3,42)
fun z -> z
LamG VarG

(3,46)-(3,70)
z
VarG

*)
