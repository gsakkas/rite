
let pipe fs = let f a x = a + fs in let base = 0 in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x = (fun n  -> n) a in let base n = n in List.fold_left f base fs;;

*)

(* changed spans
(2,26)-(2,27)
n
VarG

(2,26)-(2,27)
fun n -> n
LamG VarG

(2,26)-(2,32)
(fun n -> n) a
AppG (fromList [VarG])

(2,47)-(2,48)
fun n -> n
LamG VarG

(2,52)-(2,76)
n
VarG

*)
