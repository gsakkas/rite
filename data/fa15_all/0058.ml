
let pipe fs =
  let f a x f' x a = x a in let base = 0 in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x f' a x = x a in let base y = y in List.fold_left f base fs;;

*)

(* changed spans
(3,21)-(3,24)
fun x -> x a
LamG (AppG (fromList [EmptyG]))

(3,39)-(3,40)
fun y -> y
LamG VarG

(3,44)-(3,68)
y
VarG

*)
