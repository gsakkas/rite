
let pipe fs = let f a x a = a x in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x c = x (a c) in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(2,24)-(2,31)
fun c -> x (a c)
LamG (AppG [EmptyG])

(2,35)-(2,77)
a
VarG

(2,35)-(2,77)
c
VarG

(2,35)-(2,77)
a c
AppG [VarG]

*)
