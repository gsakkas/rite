
let pipe fs = let f a x = fs a x in let base = 0 in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x b = x (a b) in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(2,29)-(2,30)
fun b -> x (a b)
LamG (AppG (fromList [EmptyG]))

(2,31)-(2,32)
x (a b)
AppG (fromList [AppG (fromList [EmptyG])])

(2,36)-(2,76)
a
VarG

(2,36)-(2,76)
b
VarG

(2,36)-(2,76)
a b
AppG (fromList [VarG])

(2,47)-(2,48)
fun x -> x
LamG VarG

(2,52)-(2,76)
x
VarG

*)
