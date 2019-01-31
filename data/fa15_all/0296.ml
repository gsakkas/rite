
let pipe fs = let f a x = fs a x in let base = [] in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x = (fun n  -> n) a in let base n = n in List.fold_left f base fs;;

*)

(* changed spans
(2,26)-(2,28)
(fun n -> n) a
AppG (fromList [VarG])

(2,29)-(2,30)
n
VarG

(2,29)-(2,30)
fun n -> n
LamG VarG

(2,47)-(2,49)
fun n -> n
LamG VarG

(2,53)-(2,77)
n
VarG

*)
