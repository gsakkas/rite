
let pipe fs =
  let f a x = (fun result  -> fun x  -> a + x) 0 in
  let base = 1 in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x n = x (a n) in let base f = 0 in List.fold_left f base fs;;

*)

(* changed spans
(3,14)-(3,48)
fun n -> x (a n)
LamG (AppG (fromList [EmptyG]))

(3,47)-(3,48)
a n
AppG (fromList [VarG])

(4,2)-(4,42)
a
VarG

(4,2)-(4,42)
n
VarG

(4,13)-(4,14)
fun f -> 0
LamG LitG

(4,18)-(4,42)
0
LitG

*)
