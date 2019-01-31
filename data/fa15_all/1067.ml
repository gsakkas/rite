
let pipe fs = let f a x = x * a in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x x a = x a in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(2,26)-(2,27)
fun a -> x a
LamG (AppG (fromList [EmptyG]))

(2,26)-(2,27)
x a
AppG (fromList [VarG])

(2,26)-(2,31)
fun x -> fun a -> x a
LamG (LamG EmptyG)

*)
