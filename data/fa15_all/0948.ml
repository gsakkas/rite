
let pipe fs =
  let f a x p = p a x in let base z = z in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x q = x q in let base z = z in List.fold_left f base fs;;

*)

(* changed spans
(3,18)-(3,19)
fun q -> x q
LamG (AppG (fromList [EmptyG]))

(3,20)-(3,21)
x q
AppG (fromList [VarG])

(3,25)-(3,67)
q
VarG

*)
