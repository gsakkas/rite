
let pipe fs = let f a x = a x in let base = 1 in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x n = x (a n) in let base f = 0 in List.fold_left f base fs;;

*)

(* changed spans
(2,26)-(2,29)
fun n -> x (a n)
LamG (AppG (fromList [EmptyG]))

(2,33)-(2,73)
a
VarG

(2,33)-(2,73)
n
VarG

(2,33)-(2,73)
a n
AppG (fromList [VarG])

(2,44)-(2,45)
fun f -> 0
LamG LitG

(2,49)-(2,73)
0
LitG

*)
