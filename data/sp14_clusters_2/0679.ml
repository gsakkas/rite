
let pipe fs =
  let f a x = let a = x in x a in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x x a = x a in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,22)-(3,23)
fun x -> fun a -> x a
LamG (LamG EmptyG)

(3,27)-(3,30)
fun a -> x a
LamG (AppG (fromList [EmptyG]))

*)
