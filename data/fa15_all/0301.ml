
let pipe fs = let f a x = fs x in let base = 0 in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x = (fun n  -> n) a in let base n = n in List.fold_left f base fs;;

*)

(* changed spans
(2,29)-(2,30)
fun n -> n
LamG VarG

(2,34)-(2,74)
n
VarG

(2,34)-(2,74)
a
VarG

(2,45)-(2,46)
fun n -> n
LamG VarG

(2,50)-(2,74)
n
VarG

*)
