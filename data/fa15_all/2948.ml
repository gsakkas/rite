
let pipe fs =
  let f a x c d = a x in let base b = b in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x y = a (x y) in let base b = b in List.fold_left f base fs;;

*)

(* changed spans
(3,14)-(3,21)
fun y -> a (x y)
LamG (AppG (fromList [EmptyG]))

(3,20)-(3,21)
x y
AppG (fromList [VarG])

(3,25)-(3,67)
y
VarG

*)
