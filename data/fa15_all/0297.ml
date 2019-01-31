
let pipe fs = let f a x = a x in let base = [] in List.fold_left f base fs;;


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

(2,44)-(2,46)
fun n -> n
LamG VarG

(2,50)-(2,74)
n
VarG

*)
