
let pipe fs =
  let f a x a x l = x (a l) in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x y = x (a y) in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,16)-(3,27)
fun y -> x (a y)
LamG (AppG (fromList [EmptyG]))

(3,25)-(3,26)
y
VarG

*)
