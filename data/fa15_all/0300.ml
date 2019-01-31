
let pipe fs = let f a x = fs in let base = 0 in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x = (fun n  -> n) a in let base n = n in List.fold_left f base fs;;

*)

(* changed spans
(2,26)-(2,28)
(fun n -> n) a
AppG (fromList [VarG])

(2,32)-(2,72)
n
VarG

(2,32)-(2,72)
a
VarG

(2,32)-(2,72)
fun n -> n
LamG VarG

(2,43)-(2,44)
fun n -> n
LamG VarG

(2,48)-(2,72)
n
VarG

*)
