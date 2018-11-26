
let pipe fs =
  let f a x = List.map x a in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x x a = x a in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,14)-(3,22)
fun x -> fun a -> x a
LamG (LamG EmptyG)

(3,23)-(3,24)
fun a -> x a
LamG (AppG (fromList [EmptyG]))

(3,23)-(3,24)
x a
AppG (fromList [VarG])

*)
