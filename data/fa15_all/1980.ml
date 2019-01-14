
let pipe fs =
  let f a x = [x + a] in let base = [] in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x b = x b in let base b = b in List.fold_left f base fs;;

*)

(* changed spans
(3,15)-(3,16)
x b
AppG (fromList [VarG])

(3,15)-(3,20)
fun b -> x b
LamG (AppG (fromList [EmptyG]))

(3,19)-(3,20)
b
VarG

(3,36)-(3,38)
fun b -> b
LamG VarG

(3,42)-(3,66)
b
VarG

*)
