
let pipe fs =
  let f a x a x = x a in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x b = x (a b) in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,14)-(3,21)
fun b -> x (a b)
LamG (AppG (fromList [EmptyG]))

(3,20)-(3,21)
a b
AppG (fromList [VarG])

(3,25)-(3,67)
b
VarG

*)
