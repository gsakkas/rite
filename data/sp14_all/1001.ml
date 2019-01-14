
let pipe fs = let f a x = a x in let base d = d in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x a x = a x in let base d = d in List.fold_left f base fs;;

*)

(* changed spans
(2,26)-(2,29)
fun a -> fun x -> a x
LamG (LamG EmptyG)

(2,26)-(2,29)
fun x -> a x
LamG (AppG (fromList [EmptyG]))

*)
