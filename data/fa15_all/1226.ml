
let pipe fs =
  let f a x a x = x a in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x x' = x (a x') in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,14)-(3,21)
fun x' -> x (a x')
LamG (AppG (fromList [EmptyG]))

(3,20)-(3,21)
a x'
AppG (fromList [VarG])

(3,25)-(3,67)
x'
VarG

*)
