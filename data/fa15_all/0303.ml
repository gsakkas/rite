
let pipe fs =
  let f a x = a + (fs a) in let base = 0 in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x = (fun n  -> n) a in let base n = n in List.fold_left f base fs;;

*)

(* changed spans
(3,19)-(3,21)
fun n -> n
LamG VarG

(3,22)-(3,23)
n
VarG

(3,39)-(3,40)
fun n -> n
LamG VarG

(3,44)-(3,68)
n
VarG

*)
