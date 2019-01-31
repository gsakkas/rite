
let pipe fs =
  let f a x n = n (a x) in let base n = n in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x n = x (a n) in let base f = 0 in List.fold_left f base fs;;

*)

(* changed spans
(3,16)-(3,17)
x
VarG

(3,45)-(3,69)
fun f -> 0
LamG LitG

(3,45)-(3,69)
0
LitG

(3,45)-(3,69)
let base = fun f -> 0 in
List.fold_left f base fs
LetG NonRec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

*)
