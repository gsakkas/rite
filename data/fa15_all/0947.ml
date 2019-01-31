
let pipe fs =
  let f a x t = t (x a) in let base z = z in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x q = x q in let base z = z in List.fold_left f base fs;;

*)

(* changed spans
(3,16)-(3,17)
fun q -> x q
LamG (AppG (fromList [EmptyG]))

(3,21)-(3,22)
q
VarG

*)
