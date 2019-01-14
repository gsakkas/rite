
let pipe fs =
  let f a x = a + (x fs) in let base fs = fs in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x x a = x a in let base fs = fs in List.fold_left f base fs;;

*)

(* changed spans
(3,14)-(3,15)
fun x -> fun a -> x a
LamG (LamG EmptyG)

(3,18)-(3,24)
fun a -> x a
LamG (AppG (fromList [EmptyG]))

(3,21)-(3,23)
a
VarG

*)
