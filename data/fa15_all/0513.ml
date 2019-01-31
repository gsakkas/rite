
let pipe fs =
  let f a x n = n (a x) in let base = 0 in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x n = x (a n) in let base f = 0 in List.fold_left f base fs;;

*)

(* changed spans
(3,16)-(3,17)
x
VarG

(3,21)-(3,22)
n
VarG

(3,38)-(3,39)
fun f -> 0
LamG LitG

*)
