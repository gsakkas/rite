
let pipe fs =
  let f a x a x = x a in let base y = y in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x x a = x a in let base y = y in List.fold_left f base fs;;

*)

(* changed spans
(3,18)-(3,21)
fun a -> x a
LamG (AppG (fromList [EmptyG]))

*)
