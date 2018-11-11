
let pipe fs = let f a x l x = a in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x l = x (a l) in let base p = p in List.fold_left f base fs;;

*)

(* changed spans
(2,26)-(2,31)
x (a l)
AppG [AppG [EmptyG]]

(2,30)-(2,31)
x
VarG

(2,30)-(2,31)
a l
AppG [VarG]

(2,35)-(2,77)
l
VarG

(2,48)-(2,49)
fun p -> p
LamG VarG

(2,53)-(2,77)
p
VarG

*)
