
let pipe fs =
  let f a x combine x = x a in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x c = x (a c) in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,20)-(3,27)
fun c -> x (a c)
LamG (AppG (fromList [EmptyG]))

(3,26)-(3,27)
a c
AppG (fromList [VarG])

(3,31)-(3,73)
c
VarG

*)
