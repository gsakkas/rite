
let f a b a = a * b;;

let pipe fs =
  let f a x = f (x a) in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x b = x (a b) in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(5,14)-(5,15)
fun b -> x (a b)
LamG (AppG (fromList [EmptyG]))

(5,19)-(5,20)
a b
AppG (fromList [VarG])

(5,25)-(5,67)
b
VarG

*)
