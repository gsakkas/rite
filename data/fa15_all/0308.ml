
let pipe fs =
  let f a x n fs = a in let base n = n in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x = (fun a  -> x) x in let base n = n in List.fold_left f base fs;;

*)

(* changed spans
(3,19)-(3,20)
(fun a -> x) x
AppG (fromList [VarG])

(3,24)-(3,66)
x
VarG

(3,24)-(3,66)
x
VarG

(3,24)-(3,66)
fun a -> x
LamG VarG

*)
