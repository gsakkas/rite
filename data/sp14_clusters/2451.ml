
let pipe fs =
  match fs with
  | [] -> 0
  | f::fs' -> let f a x = x a in let base = fs' in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x p = x (a p) in let base b = b in List.fold_left f base fs;;

*)

(* changed spans
(5,26)-(5,29)
fun p -> x (a p)
LamG (AppG [EmptyG])

(5,28)-(5,29)
a p
AppG [VarG]

(5,33)-(5,75)
p
VarG

(5,44)-(5,47)
fun b -> b
LamG VarG

(5,51)-(5,75)
b
VarG

*)
