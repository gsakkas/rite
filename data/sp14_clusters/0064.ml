
let pipe fs = let f a x y = y a in let base b = b in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x fn = x (fun a  -> a) in
  let base b = b in List.fold_left f base fs;;

*)

(* changed spans
(2,24)-(2,31)
fun fn -> x (fun a -> a)
LamG (AppG [EmptyG])

(2,28)-(2,29)
x
VarG

(2,30)-(2,31)
fun a -> a
LamG VarG

*)
