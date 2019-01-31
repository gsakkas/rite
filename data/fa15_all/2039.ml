
let pipe fs = let f a x = a x in let base y = y in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x x a = x a in let base n = n in List.fold_left f base fs;;

*)

(* changed spans
(2,26)-(2,29)
fun x -> fun a -> x a
LamG (LamG EmptyG)

(2,26)-(2,29)
fun a -> x a
LamG (AppG (fromList [EmptyG]))

(2,33)-(2,75)
a
VarG

(2,46)-(2,47)
fun n -> n
LamG VarG

(2,51)-(2,75)
n
VarG

*)
