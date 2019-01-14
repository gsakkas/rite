
let pipe fs =
  let f a x result = a x in let base = f 1 in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x n = x (a n) in let base f = 0 in List.fold_left f base fs;;

*)

(* changed spans
(3,12)-(3,24)
fun n -> x (a n)
LamG (AppG (fromList [EmptyG]))

(3,41)-(3,42)
a
VarG

(3,46)-(3,70)
n
VarG

(3,46)-(3,70)
fun f -> 0
LamG LitG

(3,46)-(3,70)
0
LitG

(3,46)-(3,70)
let base = fun f -> 0 in
List.fold_left f base fs
LetG NonRec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

*)
