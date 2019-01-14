
let pipe fs =
  let f a x result x = a x in let base = 1 in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x n = x (a n) in let base f = 0 in List.fold_left f base fs;;

*)

(* changed spans
(3,19)-(3,26)
fun n -> x (a n)
LamG (AppG (fromList [EmptyG]))

(3,30)-(3,70)
a
VarG

(3,30)-(3,70)
n
VarG

(3,30)-(3,70)
a n
AppG (fromList [VarG])

(3,41)-(3,42)
fun f -> 0
LamG LitG

(3,46)-(3,70)
0
LitG

*)
