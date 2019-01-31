
let pipe fs =
  let f a x = a fs in let base fs = fs in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x x a = x a in let base fs = fs in List.fold_left f base fs;;

*)

(* changed spans
(3,14)-(3,15)
x
VarG

(3,14)-(3,18)
fun x -> fun a -> x a
LamG (LamG EmptyG)

(3,14)-(3,18)
fun a -> x a
LamG (AppG (fromList [EmptyG]))

*)
