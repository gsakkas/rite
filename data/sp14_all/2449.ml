
let pipe fs =
  match fs with
  | [] -> 0
  | f::fs' -> let f a x = x a in let base = f 0 in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x p = x (a p) in let base b = b in List.fold_left f base fs;;

*)

(* changed spans
(5,26)-(5,29)
fun p -> x (a p)
LamG (AppG (fromList [EmptyG]))

(5,28)-(5,29)
a p
AppG (fromList [VarG])

(5,33)-(5,75)
p
VarG

(5,46)-(5,47)
fun b -> b
LamG VarG

(5,51)-(5,75)
b
VarG

*)