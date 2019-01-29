
let pipe fs = let f a x a = a x in let base = 0 in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x c = x (a c) in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(2,24)-(2,31)
fun c -> x (a c)
LamG (AppG (fromList [EmptyG]))

(2,35)-(2,75)
a
VarG

(2,35)-(2,75)
c
VarG

(2,35)-(2,75)
a c
AppG (fromList [VarG])

(2,46)-(2,47)
fun x -> x
LamG VarG

(2,51)-(2,75)
x
VarG

*)
